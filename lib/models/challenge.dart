import 'package:cloud_firestore/cloud_firestore.dart';

class Challenge {
  final String challengeName;
  final String challengeDescription;
  String uid;

  Challenge(
      {
      required this.challengeName,
      required this.challengeDescription,

      required this.uid,});




  Map<String, dynamic> toJson() => {
    'challengeName': challengeName,
    'challengeDescription': challengeDescription,
    'uid': uid,
  };

  static Challenge fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Challenge(
      challengeName: snapshot['challengeName'] as String,
      challengeDescription: snapshot['challengeDescription'] as String,
      uid: snapshot['uid'] as String,
    );
  }


}
