import '../../models/post_model.dart';
import 'api.dart';
import 'api_path.dart';
import 'base_api.dart';

class ApiImport implements Api {
  final BaseApi _api = BaseApi();

  @override
  Future<ApiResponse<List<Post>>> posts() async {
    return _api.getRequestApi<List<Post>>(
      ApiPath().posts,
      fromJson: (json) => List<Post>.from(json.map((x) => Post.fromJson(x))),
    );
  }

  @override
  Future<ApiResponse<Post>> postDetail(int id) async {
    return _api.getRequestApi<Post>(
      ApiPath().postDetail.replaceFirst('{id}', id.toString()),
      fromJson: (json) => Post.fromJson(json),
    );
  }
}
