import 'package:get/get.dart';
import '../../../data/services/dbs/db_import.dart';
import '../../../data/models/post_model.dart';

class LocalPostController extends GetxController {
  final dbHelper = DbImport();

  var posts = <Post>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLocalPosts();
  }

  Future<void> fetchLocalPosts() async {
    isLoading(true);
    try {
      final localPosts = await dbHelper.posts();

      if (localPosts.status && localPosts.data != null) {
        posts.assignAll(localPosts.data!); // ✅ use the data
        print("Local posts fetched: ${posts.length}");
      } else {
        print("No posts found: ${localPosts.message}");
        Get.snackbar("Info", "No posts found in local database.");
      }
    } catch (e) {
      print("Failed to fetch local posts: $e");
      Get.snackbar("Error", "Could not load posts from database.");
    } finally {
      isLoading(false);
    }
  }
}
