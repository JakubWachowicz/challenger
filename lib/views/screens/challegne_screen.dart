import 'package:challenger/constants.dart';
import 'package:flutter/material.dart';

import '../../models/challenge.dart';
import '../widgets/challenge_tile.dart';
import '../widgets/leaderboard.dart';

class ChallengeView extends StatefulWidget {
  const ChallengeView({Key? key}) : super(key: key);

  @override
  State<ChallengeView> createState() => _ChallengeViewState();
}

class _ChallengeViewState extends State<ChallengeView> {
  final players = List.generate(100, (index) => 'Player ${index + 1}');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    DateTime dateEncountered = DateTime.now();
    Challenge challenge = Challenge(
        challengeName: "Running a marathon",
        challengeDescription: "Completing a full marathon within 4 hours",
        id: "abc123",imageUrl: "test");

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
                players: players,
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
            child:const Text(
              '${2}',
              style: TextStyle(fontWeight: FontWeight.bold,color:backGroundColor),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                players[3],
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
  }
}
