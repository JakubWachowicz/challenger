import 'package:challenger/utils/RoutesUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../constants.dart' as c;
import '../../../constants.dart';
import '../../widgets/text_input_field.dart';
import '../home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return  Container(
          decoration: BoxDecoration(
            color:backGroundColor,
            image: DecorationImage(
                image: const AssetImage("assets/challengerBackground.png"),
                fit: BoxFit.cover,
                colorFilter:ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.modulate,)

            ),
          ),
          alignment: Alignment.center,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width/3,
                  height: width/3,
                  decoration: const BoxDecoration(
                    image:DecorationImage(
                        image: AssetImage("assets/logo.png"),
                        fit: BoxFit.cover,

                    )
                  ),
                ),

                Text('Challenger',
                    style: TextStyle(
                      fontSize: 40,
                      color: c.buttonColor,
                      fontWeight: FontWeight.w900,
                    )),
                SizedBox(height: 30,),
                const Text('Login',
                    style: TextStyle(
                        fontSize: 30,
                        color: c.textColor,
                        fontWeight: FontWeight.w900)),

                SizedBox(height: 20,),
                Container(
                    width: width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInputField(
                        controller: _emailController,
                        labelText: 'email',
                        icon: Icons.email_outlined,
                        isObscured: false)),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    width: width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInputField(
                        controller: _passwordController,
                        labelText: 'password',
                        icon: Icons.lock,
                        isObscured: true)),
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

                        authcontroller.loginUser(
                            _emailController.text, _passwordController.text);
                      },
                      child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
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
                    child: Text(
                      'Sign in now', style: TextStyle(color: textColor,fontWeight: FontWeight.w600),)
                )


              ],
            ),
          ),
        );
  }
}
