import 'package:challenger/constants.dart';
import 'package:challenger/controllers/search_users_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/challenge.dart';
import '../../models/user.dart';
import '../widgets/challenge_tile.dart';
import '../widgets/leaderboard.dart';

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
  void initState() {
    // TODO: implement initState



    super.initState();



  }
  @override
  Widget build(BuildContext context) {





    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    DateTime dateEncountered = DateTime.now();
    Challenge challenge = Challenge(
        challengeName: "Running a marathon",
        challengeDescription: "Completing a full marathon within 4 hours",
        id: "abc123",imageUrl: "test");

    return Obx(() {
      return Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Today's challenge",
                  style: TextStyle(
                      color: buttonColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 30)),
            ),
            SizedBox(
              height: 30,
            ),
            ChallengeTile(
              challenge: challenge,
            ),

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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
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
    DocumentSnapshot userDoc =
        await firestore.collection('users').doc(uid).get();



    username = (userDoc.data()! as Map<String, dynamic>)["name"];
    return username;

  }







