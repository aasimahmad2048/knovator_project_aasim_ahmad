import 'package:get/get.dart';
import '../../../data/services/apis/api.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/local_post_detail_controller.dart';
import '../controllers/localpost_controller.dart';

class LocalPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalPostController());
    Get.lazyPut(() => LocalPostDetailController());
  }
}
