import 'dart:math';

import 'package:challenger/constants.dart';
import 'package:challenger/controllers/search_users_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/challenge.dart';
import '../../models/user.dart';
import '../widgets/challenge_tile.dart';
import '../widgets/leaderboard.dart';
import '/utils/random_challenge.dart';
import '../../controllers/challenge_controler.dart';
class ChallengeView extends StatefulWidget {
  const ChallengeView({Key? key}) : super(key: key);
  @override
  State<ChallengeView> createState() => _ChallengeViewState();
}

class _ChallengeViewState extends State<ChallengeView> {
  final players = List.generate(100, (index) => 'Player ${index + 1}');
  Future<List<User>> getUsers() async{
    QuerySnapshot querySnapshot = await firestore.collection('users').get();
    final allData = querySnapshot.docs.map(User.fromSnap).toList()!;
    return allData;
  }
  SearchController searchController = SearchController();
  List<User> getPlayers(){ 
    searchController.searchUser();
    return searchController.searchedUsers;
  }

  @override
  void initState() {// TODO: implement initState
    super.initState();
  }
  final ChallengeController challengeController = Get.put(ChallengeController());
  StopChallengeTime time = StopChallengeTime(DateTime.now());
  
  @override
  Widget build(BuildContext context) {
    return Obx(() {
    time.update(DateTime.now());
    Random rand = Random(time.seed());
    int iterator = rand.nextInt(max(challengeController.videList.length, 1));
    Challenge challenge = challengeController.videList[iterator];
      return Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Today's challenge",
                  style: TextStyle(
                      color: buttonColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 30)),
            ),
            const SizedBox(height: 30),
            ChallengeTile(challenge: challenge),
            Expanded(
              child: Leaderboard(
                players: getPlayers(),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
              ),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      '${2}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: backGroundColor),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Jakub',
                        style: TextStyle(color: backGroundColor),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

String get userName => userName;
final Rx<String> _userName = Rx<String>('');
String username = "";
Future<String> getCurrentUser() async{
  String uid = firebaseAuth.currentUser!.uid;
  DocumentSnapshot userDoc = await firestore.collection('users').doc(uid).get();
  username = (userDoc.data()! as Map<String, dynamic>)["name"];
  return username;
}