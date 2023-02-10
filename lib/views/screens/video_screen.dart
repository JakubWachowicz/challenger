import 'dart:io';

import 'package:challenger/constants.dart';
import 'package:challenger/views/screens/authentication/confirm_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/RoutesUtil.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);

    if(video != null){
<<<<<<< HEAD
      Get.toNamed(RoutesUtil.getConfirmVideo());
=======
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConfirmVideoScreen(videoFile: File(video.path), videoPath: video.path)));
>>>>>>> c5122487cf49a80f7ec172dca0e28589d148edd0
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(


        child: Column(
          children: [
            InkWell(
              onTap: (){pickVideo(ImageSource.gallery,context);},
              child: Container(
                width: 100,
                height: 60,
                child: Icon(Icons.camera,color: buttonColor,),
              ),

            ),

            InkWell(
              onTap: (){pickVideo(ImageSource.camera,context);},
              child: Container(
                width: 100,
                height: 60,
                child: Icon(Icons.camera,color: buttonColor,),
              ),

            ),
          ],
        ),

      ),
    );
  }
}
