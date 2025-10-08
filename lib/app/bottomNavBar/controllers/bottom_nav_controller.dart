import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:knovator_project_aasim_ahmad/app/ui/home/bindings/binding.dart';
import 'package:knovator_project_aasim_ahmad/app/ui/home/views/home_view.dart';
import 'package:knovator_project_aasim_ahmad/app/ui/localPost/bindings.dart/local_post_binding.dart';
import 'package:knovator_project_aasim_ahmad/app/ui/localPost/views/local_post_view.dart';

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
