import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import '../../models/post_model.dart';
import 'base_db.dart';
import 'db_path.dart';
import 'db.dart';

class DbImport implements Db {
  @override
  Future<DbResponse<List<Post>>> posts() async {
    try {
      final db = await BaseDb.database;
      final maps = await db.query(DbPath.postsTable);
      final posts = maps.map((e) => Post.fromMap(e)).toList();
      return DbResponse.success(posts);
    } catch (e) {
      return DbResponse.failed("Failed to load posts: $e");
    }
  }

  @override
  Future<DbResponse<Post>> postDetail(int id) async {
    try {
      final db = await BaseDb.database;
      final maps = await db.query(
        DbPath.postsTable,
        where: '${DbPath.colId} = ?',
        whereArgs: [id],
      );
      if (maps.isNotEmpty) {
        return DbResponse.success(Post.fromMap(maps.first));
      }
      return DbResponse.failed("Post not found");
    } catch (e) {
      return DbResponse.failed("Failed to load post: $e");
    }
  }

  @override
  Future<void> insertOrUpdatePost(Post post) async {
    final db = await BaseDb.database;

    final dbResponse = await postDetail(post.id);

    if (!dbResponse.status || dbResponse.data == null) {
      // Post not found ->insert
      await db.insert(
        DbPath.postsTable,
        post.copyWith(isRead: false).toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return;
    }
    final existingPost = dbResponse.data!;
    final networkPostJson = jsonEncode(post.toJson());
    final dbPostJson = jsonEncode(existingPost.toJson());

    if (networkPostJson != dbPostJson) {
      print("Network: $networkPostJson");
      print("DB: $dbPostJson");

      final postToUpdate = post.copyWith(isRead: existingPost.isRead);

      await db.update(
        DbPath.postsTable,
        postToUpdate.toMap(),
        where: '${DbPath.colId} = ?',
        whereArgs: [post.id],
      );
    }
  }

  @override
  Future<void> markPostAsRead(int id) async {
    final db = await BaseDb.database;
    await db.update(
      DbPath.postsTable,
      {DbPath.colIsRead: 1},
      where: '${DbPath.colId} = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<bool> isMarkedAsRead(int id) async {
    final db = await BaseDb.database;
    final maps = await db.query(
      DbPath.postsTable,
      where: '${DbPath.colId} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) return Post.fromMap(maps.first).isRead;
    return false;
  }
}
