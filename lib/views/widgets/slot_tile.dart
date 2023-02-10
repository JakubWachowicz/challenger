import 'package:challenger/constants.dart';
import 'package:flutter/material.dart';

class SlotTile extends StatelessWidget {


  const SlotTile({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Container(

      height: 20,
      decoration: BoxDecoration(
        color: buttonColor,
        border: Border.all(
          width: 8,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: const Center(
        child: Text('...'),
      ),

    );
  }
}

