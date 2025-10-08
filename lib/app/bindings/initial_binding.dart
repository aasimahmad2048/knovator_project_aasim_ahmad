import 'package:get/get.dart';
import '../bottomNavBar/bindings/bottom_nav_binding.dart';
import '../bottomNavBar/controllers/bottom_nav_controller.dart';
import '../data/services/apis/api_import.dart';
import '../ui/home/controllers/home_controller.dart';
import '../ui/localPost/controllers/localpost_controller.dart';

import '../data/services/apis/base_api.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.lazyPut(() => BaseApi());
    Get.lazyPut(() => ApiImport()); 
  }
}
