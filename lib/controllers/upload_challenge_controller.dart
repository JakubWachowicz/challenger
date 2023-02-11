



import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../models/challenge.dart';

class UpladChallengeController extends GetxController{



  Future<String> _uploadToStorage(File image,String challengeId) async {
    Reference ref = firebaseStorage
        .ref()
        .child('challengePictures')
        .child(challengeId);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }


  uplaodChallenge(String challengeName,String challengeDescription,) async{


  }

}