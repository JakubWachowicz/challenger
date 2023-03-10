import 'dart:async';

import 'package:challenger/utils/RoutesUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../constants.dart' as c;
import '../../../constants.dart';
import '../../widgets/text_input_field.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool isVisible = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    KeyboardVisibilityController().onChange.listen((visable) {
      setState(() {
        this.isVisible = !visable;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var emailInputField = TextInputField(
      controller: _emailController,
      labelText: 'email',
      icon: Icons.email_outlined,
      isObscured: false,
      errorMessage: 'Invalid email',
      dummyClass: DummyClass(isEmailValid),
    );

    var passwordInputField = TextInputField(
      controller: _passwordController,
      labelText: 'password',
      icon: Icons.lock,
      isObscured: true,
      errorMessage: 'Invalid password',
      dummyClass: DummyClass(isPasswordValid),
    );

    return Container(
      decoration: BoxDecoration(
        color: backGroundColor,
        image: DecorationImage(
            image: const AssetImage("assets/challengerBackground.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.2),
              BlendMode.modulate,
            )),
      ),
      alignment: Alignment.topCenter,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isVisible
                ? Container(
                    width: width / 3,
                    height: width / 3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/challengerlogo.png"),
                      fit: BoxFit.cover,
                    )),
                  )
                : SizedBox(),
            SizedBox(height: 10,),
            Text('Challenger',
                style: TextStyle(
                  fontSize: 40,
                  color: c.buttonColor,
                  fontWeight: FontWeight.w900,
                )),
            SizedBox(
              height: 30,
            ),
            const Text('Login',
                style: TextStyle(
                    fontSize: 30,
                    color: c.textColor,
                    fontWeight: FontWeight.w900)),
            SizedBox(
              height: 20,
            ),
            Container(
                width: width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: emailInputField),
            const SizedBox(
              height: 20,
            ),
            Container(
                width: width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: passwordInputField),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: width,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                  onTap: () {
                    print('login');

                    if (_emailController.text == "") {
                      setState(() {
                        //TODO: napisa?? seta w input text field

                        print('ererreerer');
                        emailInputField.dummyClass.isValid == false;

                        isEmailValid = false;
                      });
                    } else {
                      setState(() {
                        isEmailValid = true;
                      });
                    }

                    if (_passwordController.text == "") {
                      setState(() {
                        print('ererreerer');
                        passwordInputField.dummyClass.isValid == false;
                        isPasswordValid = false;
                      });
                    } else {
                      setState(() {
                        isPasswordValid = true;
                      });
                    }

                    authcontroller.loginUser(
                        _emailController.text, _passwordController.text);
                  },
                  child: const Center(
                      child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ))),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
                onTap: () {
                  print('sing');
                  Get.toNamed(RoutesUtil.getSignupRoute());
                },
                child: const Text(
                  'Sign in now',
                  style:
                      TextStyle(color: textColor, fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}
