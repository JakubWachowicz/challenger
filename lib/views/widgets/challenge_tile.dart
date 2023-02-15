import 'dart:async';

import 'package:challenger/constants.dart';
import 'package:challenger/views/widgets/upload_method_menu.dart';
import 'package:flutter/material.dart';


import '../../models/challenge.dart';
import '../widgets/timer.dart';

class ChallengeTile extends StatelessWidget {
  final Challenge challenge;

  const ChallengeTile({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Future openDialog() => showDialog(

        context: context,
        builder: (cntext) =>UpladMethodMenu());

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          decoration: BoxDecoration(
              color: backGroundColor,
              border: Border.all(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(35),
              image: DecorationImage(
                image: const AssetImage("assets/challengerTileBackgorund.jfif"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.2),
                  BlendMode.modulate,
                ),
              )),
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  challenge.challengeName,
                  style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8.0),
                Text(
                  challenge.challengeDescription,
                  style: TextStyle(color: textColor),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                        onTap: () {
                          print('Compete Now!');
                          openDialog();
                        },
                        child: const Center(
                            child: Text(
                          'Compete Now!',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )))),
                SizedBox(
                  height: 10,
                ),
                OtpTimer(),
              ],
            ),
          )),
    );
  }

  void setState(Null Function() param0) {}
}
