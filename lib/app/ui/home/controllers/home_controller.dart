import 'package:get/get.dart';
import 'package:knovator_project_aasim_ahmad/app/data/services/dbs/db_import.dart';
import '../../../data/models/post_model.dart';
import '../../../data/services/apis/api_import.dart';

class HomeController extends GetxController {
  late ApiImport repo = ApiImport();
  final dbHelper = DbImport();

  var posts = <Post>[].obs;
  var isLoading = false.obs;

  String get hello => "Hello world";

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    isLoading(true);
    try {
      final apiResponse = await repo.posts();

      if (apiResponse.status && apiResponse.data != null) {
        final fetchedPosts = apiResponse.data!;
        posts.assignAll(fetchedPosts);
        // Save to database
        for (var post in fetchedPosts) {
          await dbHelper.insertOrUpdatePost(post);
        }
        print(" Posts fetched: ${posts.length}");
      } else {
        print("Failed: ${apiResponse.message}");
      }
    } finally {
      isLoading(false);
    }
  }
}
