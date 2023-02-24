import 'dart:async';

import 'package:challenger/constants.dart';
import 'package:flutter/material.dart';
import '/utils/random_challenge.dart';

class OtpTimer extends StatefulWidget {
  const OtpTimer({super.key});
  @override
  OtpTimerState createState() => OtpTimerState();
}

class OtpTimerState extends State<OtpTimer> {
  final StopChallengeTime czas = StopChallengeTime(DateTime.now());
  String pozostalyCzas = "";
  late Timer _timer;

  startTimeout() {
    var duration = const Duration(seconds: 1);
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        pozostalyCzas = czas.timeLeft(null);
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        const Icon(Icons.timer,color: Colors.black, ),
        const SizedBox(
          width: 5,
        ),
        Text(czas.timeLeft(null),style: const TextStyle(color: textColor, fontSize: 17, ),),
      ],
    );
  }
}
