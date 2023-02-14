import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:challenger/views/widgets/text_input_field.dart';
import 'package:challenger/controllers/upload_video_controller.dart';

class ConfirmVideoScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;

  const ConfirmVideoScreen(
      {Key? key, required this.videoFile, required this.videoPath})
      : super(key: key);

  @override
  State<ConfirmVideoScreen> createState() => ConfirmVideoScreenState();
}

class ConfirmVideoScreenState extends State<ConfirmVideoScreen> {
  late VideoPlayerController controller;
  TextEditingController songController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  Widget build(BuildContext context) {
    var titleInputField = TextInputField(
      controller: songController,
      labelText: 'Song Name',
      icon: Icons.music_note,
      isObscured: false,
      errorMessage: 'Incorrect title',
      dummyClass: DummyClass(true),
    );

    var captionInputField = TextInputField(
      controller: captionController,
      labelText: 'Caption',
      icon: Icons.closed_caption,
      isObscured: false,
      errorMessage: 'Incorrect caption',
      dummyClass: DummyClass(true),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(controller),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width - 20,
                      child: titleInputField),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: captionInputField,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (captionController.text ==  "") {
                          setState(() {
                            titleInputField.dummyClass.isValid = false;
                          });
                        }
                        if (songController.text ==  "") {
                          setState(() {
                            titleInputField.dummyClass.isValid = false;
                          });

                          return;
                        }

                        uploadVideoController.uploadVideo(songController.text,
                            captionController.text, widget.videoPath);
                      },
                      child: const Text(
                        'Share lol',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
