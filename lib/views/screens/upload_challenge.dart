import 'dart:io';

import 'package:challenger/constants.dart';
import 'package:flutter/material.dart';

import '../../controllers/upload_challenge_controller.dart';
import '../widgets/text_input_field.dart';

class UploadChallenge extends StatefulWidget {
  const UploadChallenge({Key? key}) : super(key: key);

  @override
  State<UploadChallenge> createState() => _UploadChallengeState();
}

class _UploadChallengeState extends State<UploadChallenge> {
  final TextEditingController _challengeName = TextEditingController();

  final TextEditingController _challengeDescription = TextEditingController();

  UpladChallengeController upladChallengeController = UpladChallengeController();

  List<String> items = [
    'Sport',
    'Challenge',
    "Art",
    "Music",
    'Extreme',
    'BattleRoyal'
  ];

  Map<String, String> myMap = {
    'Sport': 'assets/challengerTileBackgorund.jfif',
    'Challenge': 'assets/challengerTileBackgorund.jfif',
    "Art": 'assets/challengerTileBackgorund.jfif',
    "Music": 'assets/challengerTileBackgorund.jfif',
    "Extreme": 'assets/challengerTileBackgorund.jfif',
    "BattleRoyal": 'assets/challengerTileBackgorund.jfif',
  };



  String? selectedItem = 'Sport';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Upload Challenge',style: TextStyle(color: buttonColor,fontSize: 30,fontWeight: FontWeight.w500),),
            const SizedBox(
              height: 20,
            ),
            TextInputField(controller: _challengeName,
              labelText: 'Challenge name',
              isObscured: false,
              icon: Icons.text_fields,),
            const SizedBox(
              height: 20,
            ),
            TextInputField(controller: _challengeDescription,
              labelText: 'Challenge description',
              isObscured: false,
              icon: Icons.text_fields,),
            const SizedBox(
              height: 20,
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Category',style: TextStyle(color: textColor,fontSize: 15,fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: backGroundColor, //<-- SEE HERE
                ),
                child: DropdownButton<String>(
                  dropdownColor: backGroundColor,
                  value: selectedItem,
                  items: const [
                    DropdownMenuItem<String>(
                      child: Text('Sport',style: TextStyle(color:textColor),),
                      value: 'Sport',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Challenge',style: TextStyle(color:textColor)),
                      value: 'Challenge',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Art',style: TextStyle(color:textColor)),
                      value: 'Art',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Music',style: TextStyle(color:textColor)),
                      value: 'Music',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Extreme',style: TextStyle(color:textColor)),
                      value: 'Extreme',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Battle Royal',style: TextStyle(color:textColor)),
                      value: 'BattleRoyal',
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value;
                    });


                  },
                  hint: Text('Select an option'),
                ),
              ),
            ),
            SizedBox(height: height/20,),

          InkWell(
            onTap: () {

              if(_challengeName.text != null && _challengeDescription.text != null){

                upladChallengeController.uploadChallenge(
                    _challengeName.text, _challengeDescription.text,
                    File(myMap[selectedItem]!));

              }

            },

            child: Container(
              height: height/15,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text(
                      'upload',
                      style: TextStyle(color: backGroundColor,fontWeight: FontWeight.w500,fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
