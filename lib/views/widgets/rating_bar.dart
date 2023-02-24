import 'package:challenger/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;

import '../../models/video.dart';

class RainbowRatingBar extends StatefulWidget {
   RainbowRatingBar({Key? key,required this.video}) : super(key: key);

  Video video;
  @override
  State<RainbowRatingBar> createState() => _RainbowRatingBarState();
}

class _RainbowRatingBarState extends State<RainbowRatingBar> {



  bool isRated = true;
  GivePointsToVide(Video video,int points) async{


    print(points);

    DocumentSnapshot doc = await firestore.collection('videos').doc(video.id).get();
    var uid = firebaseAuth.currentUser?.uid;

    var pointsL = <dynamic>[points];
    var usersL = <dynamic>[uid];

    if((doc.data()! as dynamic)['users'].contains(uid) == false){



      int currentPoints =int.parse(video.points);
      currentPoints+= points.toInt();

      await firestore.collection('videos').doc(video.id).update({


        'points':(points.toString()),
        'users':FieldValue.arrayUnion(usersL),
      });



    }



  }


  @override
  void initState() {
    // TODO: implement initState


    checkIfRated(widget.video);
    super.initState();
  }
  int val = 3;
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: Colors.transparent,
        body:Align(
          alignment:  Alignment.topRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,


            children: [
              SizedBox(height: height/4,),
              Container(
                child: RotatedBox(
                 quarterTurns: 2,
                  child: Container(
      width: 100,
      height: 300,
      child:  isRated?Column(
        children: [
          ElevatedButton(onPressed: (){
            GivePointsToVide(widget.video,val);
          },
              style: ElevatedButton.styleFrom(primary: Colors.transparent),
              child: Icon(Icons.confirmation_num_sharp,color: buttonColor,)),
          RatingBar(
                      wrapAlignment: WrapAlignment.start,
                      minRating: 1,
                      maxRating: 5,
                      initialRating: 3,
                      direction: Axis.vertical,
                      ratingWidget: RatingWidget(
                        full: RotatedBox(
                            quarterTurns: 2,
                            child:Icon(
                          Icons.star,
                          color: buttonColor,
                              size: 200,
                        )),
                        half: Icon(
                          Icons.star_half,
                          color: buttonColor,
                          size: 20,
                        ),
                        empty: const Icon(
                          Icons.star_border,
                          color: Colors.grey,
                        ),
                      ),
                      onRatingUpdate: (double value) {


                        setState(() {
                          val = value.round();
                        });


                      },
          ),


        ],
      ):SizedBox(),
    ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> checkIfRated(Video video) async {

    DocumentSnapshot doc = await firestore.collection('videos').doc(video.id).get();
    var uid = firebaseAuth.currentUser?.uid;
    if((doc.data()! as dynamic)['users'].contains(uid) == true){

      setState(() {
        isRated = false;
      });







    }

  }
}
