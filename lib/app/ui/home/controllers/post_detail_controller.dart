import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../data/models/post_model.dart';
import '../../../data/services/apis/api_import.dart';
import '../../../data/services/apis/base_api.dart';
import '../../localPost/controllers/local_post_detail_controller.dart';

class PostDetailController extends GetxController {
  LocalPostDetailController localPostDetailController =
      Get.put<LocalPostDetailController>(LocalPostDetailController());

  int id = Get.arguments;
  @override
  void onReady() async {
    super.onReady();
    fetchPost(id);
    localPost.value = await localPostDetailController.fetchLocalPost(id);
  }

  late ApiImport repo = ApiImport();

  var isLoading = false.obs;

  var post = Rxn<Post>();
  var localPost = Rxn<Post>();

  String get hello => "Hello world";

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchPost(id) async {
    isLoading(true);
    try {
      ApiResponse apiResponse = await repo.postDetail(id);
      if (apiResponse.status) {
        post.value = apiResponse.data;
      }
    } finally {
      isLoading(false);
    }
  }
}
