import 'package:challenger/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:challenger/models/video.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
//magic of video uploading happens hereehehehehehe
  compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }

  Future<String> uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    UploadTask uploadTask = ref.putFile(await compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();

      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length+1;
      String videoUrl = await uploadVideoToStorage("Video $len", videoPath);
      String thumbnail = await uploadImageToStorage('Video $len', videoPath);

      Video video = Video(username:(userDoc.data()! as Map<String, dynamic>)["name"],
          uid:uid,
        id:"Video $len",
        likes: ["Jan"],
        commentCount: 0,
        shareCount: 0,
        title: songName,
        caption: caption,
        videoUrl: videoUrl,
        profilePhoto: '',
        thumbnail: thumbnail
      );
      await firestore.collection('videos').doc("Video $len").set(video.toJson());
      Get.back();
    } catch (e) {
      Get.snackbar("Error ",e.toString());
    }
  }
}
