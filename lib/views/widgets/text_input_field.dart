import 'package:flutter/material.dart';

import '../../constants.dart';


class DummyClass{

  DummyClass(bool isValid){
    this.isValid =isValid;
  }
  bool isValid = true;
}
class TextInputField extends StatefulWidget {

  final TextEditingController controller;
  final String labelText;
  final IconData  icon;
  final bool isObscured;
  final String errorMessage;
  final DummyClass dummyClass;


  const TextInputField({Key? key, required this.controller, required this.labelText, required this.icon, required this.isObscured, required this.errorMessage,required this.dummyClass }) : super(key: key);


  @override
  State<TextInputField> createState() => TextInputFieldState();


  void setIsValid(bool isValid) {

    dummyClass.isValid = false;
    isValid = false;



  }


}


class TextInputFieldState extends State<TextInputField> {
  bool showSuffix = true;







  @override
  Widget build(BuildContext context) {


    return  TextField(


      style: TextStyle(color: textColor),

        controller: widget.controller,
        decoration: InputDecoration(
          errorText: widget.dummyClass.isValid ? null : widget.errorMessage,
          filled: true,
          fillColor: backGroundColor,
          labelText: widget.labelText,
          prefixIcon: Icon(widget.icon, color: borderColor,),
          suffixIcon: widget.isObscured?GestureDetector(onTap:(){
            setState(() {
              showSuffix = !showSuffix;
            });
          } ,child: Icon(showSuffix? Icons.visibility:Icons.visibility_off, color: borderColor,),):null,
          labelStyle: const TextStyle(fontSize: 20,color: textColor),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: borderColor)),
          focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: buttonColor)),
        ),
      obscureText: widget.isObscured? showSuffix:false,


    );
  }
}
