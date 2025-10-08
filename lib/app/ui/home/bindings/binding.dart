import 'package:get/get.dart';
import '../../../data/services/apis/api.dart';
import '../controllers/home_controller.dart';
import '../controllers/post_detail_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => PostDetailController());
  }
}
