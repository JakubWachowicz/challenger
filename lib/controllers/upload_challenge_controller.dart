



import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../constants.dart';
import '../models/challenge.dart';

class UpladChallengeController extends GetxController{



  Future<String> uploadImageToStorage(String id, File imagePath) async {

    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);


    Reference ref = firebaseStorage.ref().child("challengeImages").child(id);
    UploadTask uploadTask = ref.putFile(File(image!.path));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadChallenge(String challengeName,String challengeDescription,File imagePath) async{


    try{

      var allDocs = await firestore.collection('challenges').get();
      int len = allDocs.docs.length;
      String imageUrl = await uploadImageToStorage('Challenge $len', imagePath);
      Challenge challenge = Challenge(challengeName: challengeName, challengeDescription: challengeDescription,  id:"Challenge $len",imageUrl: imageUrl);
      await firestore.collection('challenges').doc("Challenge $len").set(challenge.toJson());
      Get.back();
    }
    catch(e){
      Get.snackbar("error", e.toString());
    }


  }

}