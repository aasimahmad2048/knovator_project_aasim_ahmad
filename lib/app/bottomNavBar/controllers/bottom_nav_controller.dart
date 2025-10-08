import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../ui/home/bindings/binding.dart';
import '../../ui/home/views/home_view.dart';
import '../../ui/localPost/bindings.dart/local_post_binding.dart';
import '../../ui/localPost/views/local_post_view.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  late final List<Widget> pages;

  @override
  void onInit() {
    super.onInit();

    pages = [
      Builder(
        builder: (_) {
          HomeBinding().dependencies();
          return HomeView();
        },
      ),
      Builder(
        builder: (_) {
          LocalPostBinding().dependencies();
          return LocalPostView();
        },
      ),
    ];

    // pages = [HomeView(), LocalPostView()];
  }

  void changePage(int index) {
    currentIndex.value = index;
  }
}
