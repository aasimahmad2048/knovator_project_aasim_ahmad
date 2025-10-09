import 'package:flutter/material.dart';
import 'package:knovator_project_aasim_ahmad/app/data/models/post_model.dart';

class PostDetailContent extends StatelessWidget {
  final Post? post;

  const PostDetailContent({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    if (post == null) {
      return const Center(child: Text("Post not found."));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildCard("ID", post?.id.toString() ?? 'N/A')),
              Expanded(
                child: _buildCard("User ID", post?.userId.toString() ?? 'N/A'),
              ),
            ],
          ),
          _buildCard("Title", post?.title ?? 'N/A'),
          _buildCard("Body", post?.body ?? 'N/A'),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
