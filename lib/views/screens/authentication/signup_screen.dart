import 'package:challenger/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../constants.dart' as c;
import '../../../constants.dart';
import '../../../utils/RoutesUtil.dart';
import '../../widgets/text_input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();





  @override
  Widget build(BuildContext context) {

    var userInputField = TextInputField(
      controller: _userNameController,
      labelText: 'user name',
      icon: Icons.person,
      isObscured: false,
      dummyClass: DummyClass(true),
      errorMessage: 'invalid user name',

    );

    var emailInputField = TextInputField(
      controller: _emailController,
      labelText: 'email',
      icon: Icons.email_outlined,
      isObscured: false,
      dummyClass: DummyClass(true),
      errorMessage: 'invalid email');

    var passwordInputField = TextInputField(
      controller: _passwordController,
      labelText: 'password',
      icon: Icons.lock,
      isObscured: true,
      dummyClass: DummyClass(true),
      errorMessage: 'invalid email');



    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Registration',
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
              child: userInputField),
          const SizedBox(
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
                  authcontroller.registerUser(_userNameController.text,
                      _emailController.text, _passwordController.text);
                  Get.toNamed(RoutesUtil.getLoginRoute());
                },
                child: const Center(
                    child: Text(
                  'register',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ))),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
              onTap: () {
                print('sing');
                Get.toNamed(RoutesUtil.getLoginRoute());
              },
              child: Text('Already have an account?',style: TextStyle(color: textColor,fontWeight: FontWeight.w600),))
        ],
      ),
    ));
  }
}
