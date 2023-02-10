import 'package:cloud_firestore/cloud_firestore.dart';

class Challenge {
  final String challengeName;
  final String challengeDescription;
  final dateEncountered;
  String uid;

  Challenge(
      {
      required this.challengeName,
      required this.challengeDescription,
      required this.dateEncountered,
      required this.uid,});




  Map<String, dynamic> toJson() => {
    'challengeName': challengeName,
    'challengeDescription': challengeDescription,
    'dateEncountered': dateEncountered.toIso8601String(),
    'uid': uid,
  };

  static Challenge fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Challenge(
      challengeName: snapshot['challengeName'] as String,
      challengeDescription: snapshot['challengeDescription'] as String,
      dateEncountered: (snapshot['dateEncountered'] as Timestamp).toDate(),
      uid: snapshot['uid'] as String,
    );
  }


}
