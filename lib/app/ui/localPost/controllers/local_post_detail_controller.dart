import 'package:get/get.dart';
import '../../../data/services/dbs/db_import.dart';
import '../../../data/models/post_model.dart';
import 'localpost_controller.dart';

class LocalPostDetailController extends GetxController {
  int? id = Get.arguments;
  var post = Rxn<Post>();
  var isLoading = false.obs;

  final dbHelper = DbImport();

  @override
  void onReady() async {
    super.onReady();
    post.value = await fetchLocalPost(id);
    if (post.value != null && !post.value!.isRead) {
      await markPostAsRead(id: id!);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    // Refresh the local posts list when returning from detail view
    // This ensures the 'read' status is updated in the list
    if (Get.isRegistered<LocalPostController>()) {
      Get.find<LocalPostController>().fetchLocalPosts();
    }
  }

  Future<void> markPostAsRead({required int id}) async {
    try {
      await dbHelper.markPostAsRead(id);
      print("This is fine ");
      Get.snackbar("Success", "Post marked as read.");
    } catch (e) {
      print("Failed to mark post as read: $e");
      Get.snackbar("Error", "Could not mark post as read.");
    }
  }

  Future<bool> isMarkedAsRead({required int id}) async {
    try {
      return await dbHelper.isMarkedAsRead(id);
    } catch (e) {
      print("Failed to read the post from DB");
      Get.snackbar("Error", "Could not read post from db");
      return false;
    }
  }

  Future<Post?> fetchLocalPost(int? id) async {
    if (id == null) {
      Get.snackbar("Error", "Invalid post ID.");
      return null;
    }

    isLoading(true);
    try {
      final dbResponse = await dbHelper.postDetail(id);
      if (dbResponse.status && dbResponse.data != null) {
        return dbResponse.data;
      } else {
        Get.snackbar(
          "Error",
          dbResponse.message ?? "Post not found in local database.",
        );
        return null;
      }
    } catch (e) {
      print("Failed to fetch local post: $e");
      Get.snackbar("Error", "Could not load post from database.");
      return null;
    } finally {
      isLoading(false);
    }
  }
}
