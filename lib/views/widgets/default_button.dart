import 'package:flutter/material.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.voidCallback, required this.text}) : super(key: key);

  final Function voidCallback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: () {
         VoidCallbackAction;
        },
        child: Center(
            child: Text(
             text,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700),
            )));
  }
}
