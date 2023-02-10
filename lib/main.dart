import 'package:challenger/constants.dart';
import 'package:challenger/controllers/authentication_controller.dart';
import 'package:challenger/utils/RoutesUtil.dart';
import 'package:challenger/views/screens/authentication/login_screen.dart';
import 'package:challenger/views/screens/authentication/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthenticationClontroller());
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backGroundColor,
      ),
      initialRoute: RoutesUtil.getLoginRoute(),
      getPages: RoutesUtil.routes,
    );
  }
}
