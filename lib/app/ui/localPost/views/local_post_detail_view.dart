import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controllers/local_post_detail_controller.dart';

class LocalPostDetailView extends GetView<LocalPostDetailController> {
  const LocalPostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [Icon(Icons.cloud_off_outlined), SizedBox(width: 20)],
      ),
      body: SafeArea(
        child: Center(
          child: Obx(
            () => Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: buildCard(
                            "ID",
                            controller.post.value?.id.toString() ?? "",
                          ),
                        ),
                        Expanded(
                          child: buildCard(
                            "User ID",
                            controller.post.value?.userId.toString() ?? "",
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: double.infinity,
                      child: buildCard(
                        "Title",
                        controller.post.value?.title ?? "",
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: buildCard(
                        "Body",
                        controller.post.value?.body ?? "",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(String title, String value) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
