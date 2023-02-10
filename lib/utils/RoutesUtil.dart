import 'package:challenger/views/screens/home_screen.dart';
import 'package:challenger/views/screens/authentication/login_screen.dart';
import 'package:challenger/views/screens/authentication/signup_screen.dart';
import 'package:challenger/views/screens/authentication/confirm_video_screen.dart';
import 'package:get/get.dart';

import '../views/screens/authentication/confirm_video_screen.dart';

class RoutesUtil{

  static const String _home = "/";
  static const String _login = "/login";
  static const String _signup = "/signup";
  static const String _confirm = "/confirm";

  static String getHomeRoute()=>_home;
  static String getLoginRoute()=>_login;
  static String getSignupRoute()=>_signup;
  static String getConfirmVideo()=>_confirm;

  static List<GetPage> routes = [
    GetPage(name: _home, page: ()=>HomeScreen()),
    GetPage(name: _login, page: ()=>LoginScreen()),
    GetPage(name: _signup, page: ()=>SignUpScreen()),
<<<<<<< HEAD


=======
    //GetPage(name: _confirm, page: () => ConfirmVideoScreen()),
>>>>>>> c5122487cf49a80f7ec172dca0e28589d148edd0
  ];
}