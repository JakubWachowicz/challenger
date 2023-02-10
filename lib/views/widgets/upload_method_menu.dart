import 'package:challenger/views/widgets/button_with_icon.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class UpladMethodMenu extends StatefulWidget {
  const UpladMethodMenu({Key? key}) : super(key: key);

  @override
  State<UpladMethodMenu> createState() => _UpladMethodMenuState();
}

class _UpladMethodMenuState extends State<UpladMethodMenu> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
          width: width,
          height: width*0.8,
          decoration: BoxDecoration(
              color: backGroundColor,
              borderRadius: BorderRadius.circular(20)),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                SizedBox(height: height/20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Upload your attempt',
                    style: TextStyle(
                      color: buttonColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,

                    ),
                  ),
                ),
                SizedBox(height: height/30,),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ButtonWithIcon(icon: Icon(Icons.camera),text:'Create short'),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ButtonWithIcon(icon: Icon(Icons.image_rounded),text: 'Browse gallery',)
                ),
              ],
            ),
          )),
    );
  }
}
