import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Network Posts")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.posts.isEmpty) {
          return const Center(
            child: Text("No Network posts found. Check Local Posts"),
          );
        }

        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final post = controller.posts[index];
            return Container(
              decoration: BoxDecoration(
                color: post.isRead ? Colors.white : Colors.yellow[100],
                border: Border.all(color: Colors.blueAccent),
              ),
              child: InkWell(
                onTap: () =>
                    Get.toNamed(Routes.localPostDetail, arguments: post.id),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 25,
                    child: Text(post.id.toString()),
                  ),
                  // trailing: post.isModified
                  //     ? Icon(Icons.change_circle_rounded)
                  //     : SizedBox(),
                  title: Text(
                    post.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    post.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
