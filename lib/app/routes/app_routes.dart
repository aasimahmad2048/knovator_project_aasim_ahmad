abstract class Routes {
  Routes._();

  static const bottomNavBar = _Paths.bottomNavBar;

  static const home = _Paths.home;
  static const postDetail = _Paths.postDetail;
  static const localPosts = _Paths.localPosts;
  static const localPostDetail = _Paths.localPostsDetail;
}

abstract class _Paths {
  _Paths._();
  static const bottomNavBar = '/';
  static const home = '/home';
  static const localPosts = '/localposts';
  static const localPostsDetail = '/localpostDetail';

  static const postDetail = '/postdetail';
}
