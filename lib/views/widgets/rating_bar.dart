import 'package:challenger/constants.dart';
import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;

class RainbowRatingBar extends StatefulWidget {
  const RainbowRatingBar({Key? key}) : super(key: key);

  @override
  State<RainbowRatingBar> createState() => _RainbowRatingBarState();
}

class _RainbowRatingBarState extends State<RainbowRatingBar> {
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
      child: RatingBar(
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
                    empty: Icon(
                      Icons.star_border,
                      color: Colors.grey,
                    ),
                  ),
                  onRatingUpdate: (double value) {},
      ),
    ),
                ),
              ),
            ],
          ),
        ));
  }
}
