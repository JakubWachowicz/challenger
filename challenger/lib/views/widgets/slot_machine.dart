import 'dart:math';

import 'package:challenger/views/widgets/slot_tile.dart';
import 'package:flutter/material.dart';

class SlotMachine extends StatelessWidget {
  const SlotMachine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(itemExtent: 3,
      children: [
          SlotTile(),
          SlotTile(),
          SlotTile(),

      ],

    );
  }
}
