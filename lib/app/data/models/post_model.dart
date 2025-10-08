import 'dart:convert';

// Parse list of posts
List<Post> postsFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

// Parse single post
Post postFromJson(String str) => Post.fromJson(json.decode(str));

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  final bool isRead;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.isRead,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'],
    userId: json['userId'],
    isRead: json['isRead'] ?? false,
    title: json['title'],
    body: json['body'],
  );

  factory Post.fromMap(Map<String, dynamic> map) => Post(
    id: map['id'],
    userId: map['userId'],
    isRead: map['isRead'] == 1,
    title: map['title'],
    body: map['body'],
  );

  Post copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
    bool? isRead, 
  }) {
    return Post(
      id: id ?? this.id,
      body: body ?? this.body,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'isRead': isRead,
    'title': title,
    'body': body,
    'userId': userId,
  };

  Map<String, dynamic> toMap() => {
    'id': id,
    'isRead': (isRead) ? 1 : 0,
    'title': title,
    'body': body,
    'userId': userId,
  };
}
