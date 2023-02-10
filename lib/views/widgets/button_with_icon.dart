import 'package:flutter/material.dart';

import '../../constants.dart';


class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({Key? key, required this.icon, required this.text}) : super(key: key);

  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  InkWell(
      child: Container(
        height: height/15,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: width / 15,
              ),
              Text(
                text,
                style: TextStyle(color: backGroundColor,fontWeight: FontWeight.w500,fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
