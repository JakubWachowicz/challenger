import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem({Key? key, required this.videoUrl}) : super(key: key);



  final String videoUrl;

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {

  late VideoPlayerController _videoController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoController = VideoPlayerController.network(widget.videoUrl)..initialize().then((value) {
      _videoController.play();
      _videoController.setLooping(true);

    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController.dispose();
  }
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Container(
      height: height,
      width: width,

      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: VideoPlayer(_videoController),

    );
  }
}
