import 'package:challenger/controllers/upload_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../controllers/video_controller.dart';
import '../widgets/video_player_item.dart';
import 'package:preload_page_view/preload_page_view.dart';

class VideoScreen extends StatefulWidget {
   VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
   final VideoController videoPlayerController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(body: Obx(()
        { return PageView.builder(
            itemCount: videoPlayerController.videList.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final data = videoPlayerController.videList[index];
              return Stack(
                children: [
                  VideoPlayerItem(videoUrl: data.videoUrl,),

                  Column(
                    children: [
                      const SizedBox(height: 100,),
                      Expanded(child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(child: Container(
                            padding: const EdgeInsets.only(
                                left: 20),
                            child: Column(mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("username"),
                                Text('caption')
                              ],),))
                        ],)),

                    ],
                  ),

                  Container(
                    width: 100,
                    margin: EdgeInsets.only(top: height / 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      ],
                    ),
                  )
                ],
              );
            });
        }));
  }
}
