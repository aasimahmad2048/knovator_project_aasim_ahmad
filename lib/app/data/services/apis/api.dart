import 'package:http/http.dart';

import '../../models/post_model.dart';
import 'base_api.dart';

abstract class Api {
  Future<ApiResponse> posts();
  Future<ApiResponse> postDetail(int id);
}
