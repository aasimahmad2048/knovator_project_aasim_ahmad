import '../../models/post_model.dart';
import 'base_db.dart';

abstract class Db {
  Future<DbResponse<List<Post>>> posts();
  Future<DbResponse<Post>> postDetail(int id);
  Future<void> insertOrUpdatePost(Post post);
  Future<void> markPostAsRead(int id);
  Future<bool> isMarkedAsRead(int id);
}
