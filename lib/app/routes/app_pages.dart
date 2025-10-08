import 'package:get/get.dart';
import '../bottomNavBar/bindings/bottom_nav_binding.dart';
import '../bottomNavBar/views/bottom_nav_view.dart';
import '../ui/home/bindings/binding.dart';
import '../ui/home/views/home_view.dart';
import '../ui/home/views/post_detail_view.dart';
import '../ui/localPost/bindings.dart/local_post_binding.dart';
import '../ui/localPost/views/local_post_view.dart';
import '../ui/localPost/views/local_post_detail_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.bottomNavBar,
      page: () => BottomNavView(),
      binding: BottomNavBinding(),
    ),
    GetPage(name: Routes.home, page: () => HomeView(), binding: HomeBinding()),

    GetPage(
      name: Routes.localPosts,
      page: () => LocalPostView(),
      binding: LocalPostBinding(),
    ),
    GetPage(
      name: Routes.postDetail,
      page: () => PostDetailView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.localPostDetail,
      page: () => LocalPostDetailView(),
      binding: LocalPostBinding(),
    ),
  ];
}
