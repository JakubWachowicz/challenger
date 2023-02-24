import 'package:challenger/constants.dart';
import 'package:challenger/models/challenge.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChallengeController extends GetxController {

  ChallengeController();
  final Rx<List<Challenge>> _challengeList = Rx<List<Challenge>>([]);

  List<Challenge> get videList => _challengeList.value;

  @override
  void onInit() {
    super.onInit();
    _challengeList.bindStream(
        firestore.collection('challenges').snapshots().map((QuerySnapshot query) {
      List<Challenge> retList = [];
      for (var element in query.docs) {
        retList.add(Challenge.fromSnapshot(element));
      }
      return retList;
    }));
  }
}
