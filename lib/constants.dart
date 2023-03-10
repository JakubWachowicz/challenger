import 'package:challenger/controllers/authentication_controller.dart';
import 'package:challenger/utils/ColorUtil.dart';
import 'package:challenger/views/screens/challegne_screen.dart';
import 'package:challenger/views/screens/upload_challenge.dart';
import 'package:challenger/views/screens/viedo_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';

//Screen size

late final double screenWidth;
late final double screenHeight;

 var pages = [
  ChallengeView(),
  VideoScreen(),
  //Text('Video display',style: TextStyle(color: Colors.white),),
  UploadChallenge(),
];

//Colors
//final backGroundColor  = '#f7d5e1'.toColor();
const backGroundColor = Colors.black;
const textColor = Colors.white54;
//const buttonColor = Colors.deepOrangeAccent;
//final buttonColor = '#ffcc00'.toColor();
//final buttonColor = '#ff5500'.toColor();
//final buttonColor ='#f7d5e1'.toColor();
final buttonColor = '#30d5c8'.toColor();
final borderColor = '#f7d5e1'.toColor();
final borderFocusedColor = '#d5325f'.toColor();

//Firebase

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//Controllers

var authcontroller = AuthenticationClontroller.instance;
