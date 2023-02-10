import 'package:flutter/material.dart';

import '../../constants.dart';

class Leaderboard extends StatelessWidget {
  final List<String> players;

  Leaderboard({required this.players});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: backGroundColor
      ),
      child: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 30,
                  alignment: Alignment.center,
                  child: index < 3
                      ? Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                          size: 20,
                        )
                      : Text(
                          '${index+1}',
                          style: TextStyle(fontWeight: FontWeight.bold,color:textColor),
                        ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      players[index],
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
