import 'package:get/get.dart';
import 'package:rcm_app/page/home.dart';
import 'package:rcm_app/page/login.dart';

part 'routes.dart';

class AppPages {
  static const Login = _Paths.Login;
  static const Home = _Paths.Home;
}

abstract class _Paths {
  static const Login = '/login';
  static const Home = '/';
}
