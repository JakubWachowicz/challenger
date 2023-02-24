

import 'package:challenger/constants.dart';
import 'package:challenger/views/screens/home_screen.dart';
import 'package:challenger/views/screens/authentication/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:challenger/models/user.dart' as model;

import '../utils/RoutesUtil.dart';

class AuthenticationClontroller extends GetxController{

  late Rx<User?> _user;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    //ever(_user, _setInitialScreen);
  }

  //TODO:Bardzo cool rzecz
  /*_setInitialScreen(User? user){
    if(user==null){
      Get.offAll(()=>LoginScreen());
    }else{
      Get.offAll(()=>HomeScreen());
    }
  }*/

  static AuthenticationClontroller instance = Get.find();

  Future<bool> registerUser(String username,String email,String password) async {
    try{
      if(username.isNotEmpty && email.isNotEmpty && password.isNotEmpty){
        var cred = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        model.User user = model.User(name:username,email: email,uid:cred.user!.uid);
        await firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
        print('userCreated');
        Get.snackbar("Creating account succeed", "you are ready to login!");
      }else{
          Get.snackbar("Error creating account", "enter all fields");}
      return false;
    }catch(e){
        Get.snackbar("Error", e.toString());
        return false;
    }
    return true;
  }
  void loginUser(String email,String password) async{
    try{
      if(email.isNotEmpty && password.isNotEmpty){

        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        print('login succesed');
        Get.toNamed(RoutesUtil.getHomeRoute());

      }else{
        Get.snackbar("Error creating account", "enter all fields");}
    }catch(e){
      Get.snackbar("error while uploading", e.toString());
    }
  }
}