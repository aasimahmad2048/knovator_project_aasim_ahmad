import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovator_project_aasim_ahmad/app/ui/localPost/views/post_detail_content.dart'; 
import '../controllers/local_post_detail_controller.dart';

class LocalPostDetailView extends GetView<LocalPostDetailController> {
  const LocalPostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Post Detail'),
        actions: const [Icon(Icons.cloud_off_outlined), SizedBox(width: 20)],
      ),
      body: SafeArea(
        child: Center(
          child: Obx(() => PostDetailContent(post: controller.post.value)),
        ),
      ),
    );
  }
}
