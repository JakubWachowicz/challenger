import 'package:cloud_firestore/cloud_firestore.dart';

class Challenge {
  final String challengeName;
  final String challengeDescription;
  final String imageUrl;
  String id;

  Challenge({
    required this.challengeName,
    required this.challengeDescription,
    required this.id,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() => {
        'challengeName': challengeName,
        'challengeDescription': challengeDescription,
        'uid': id,
        'imageUrl': imageUrl
      };

  static Challenge fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Challenge(
        challengeName: snapshot['challengeName'] as String,
        challengeDescription: snapshot['challengeDescription'] as String,
        id: snapshot['uid'] as String,
        imageUrl: snapshot['imageUrl'] as String);
  }
}
