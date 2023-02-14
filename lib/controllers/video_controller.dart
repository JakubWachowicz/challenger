import 'package:challenger/constants.dart';
import 'package:challenger/models/video.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {

  VideoController();
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);

  List<Video> get videList => _videoList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _videoList.bindStream(
        firestore.collection('videos').snapshots().map((QuerySnapshot query) {
      List<Video> retList = [];
      for (var element in query.docs) {
        retList.add(Video.fromSnap(element));
      }
      return retList;
    }));
  }
}
