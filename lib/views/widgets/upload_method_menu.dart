import 'dart:io';

import 'package:challenger/views/screens/authentication/confirm_video_screen.dart';
import 'package:challenger/views/widgets/button_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';
import '../../utils/RoutesUtil.dart';

class UpladMethodMenu extends StatefulWidget {
  const UpladMethodMenu({Key? key}) : super(key: key);

  @override
  State<UpladMethodMenu> createState() => _UpladMethodMenuState();
}

class _UpladMethodMenuState extends State<UpladMethodMenu> {

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);

    if(video != null){

      Get.toNamed(RoutesUtil.getConfirmVideo());
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConfirmVideoScreen(videoFile: File(video.path), videoPath: video.path)));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //Text('Upload your attempt',style: TextStyle(color: backGroundColor,fontWeight: FontWeight.w500,fontSize: width/15),),
             SizedBox(height: height/40,),
             Padding(
              padding: EdgeInsets.all(15.0),
              child: InkWell(
                onTap: (){pickVideo(ImageSource.camera,context);},
                child: Container(
                  height: height/15,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: width / 15,
                        ),
                        const Text(
                          'Create short',
                          style: TextStyle(color: backGroundColor,fontWeight: FontWeight.w500,fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ),
             Padding(
              padding: EdgeInsets.all(15.0),
              child: InkWell(
                onTap: (){pickVideo(ImageSource.gallery,context);},
                child: Container(
                  height: height/15,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.image_rounded),
                        SizedBox(
                          width: width / 15,
                        ),
                        const Text(
                          'Browse gallery',
                          style: TextStyle(color: backGroundColor,fontWeight: FontWeight.w500,fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ),
          ],
        ),
    );
  }
}
