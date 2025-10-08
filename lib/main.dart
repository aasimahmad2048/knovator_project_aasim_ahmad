import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/bottomNavBar/views/bottom_nav_view.dart';
import 'app/routes/app_pages.dart';
import 'app/bindings/initial_binding.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Knovator Project",
      initialBinding: InitialBinding(),
      home: BottomNavView(),
      getPages: AppPages.pages,
    ),
  );
}
