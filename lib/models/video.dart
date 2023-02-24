import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String username;
  String uid;
  String id;
  String points;
  List<dynamic> users;
  int commentCount;
  int shareCount;
  String title;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePhoto;
  Video({
      required this.username,
      required this.uid,
      required this.id,
      required this.points,
      required this.commentCount,
      required this.shareCount,
      required this.title,
      required this.caption,
      required this.videoUrl,
      required this.thumbnail,
      required this.profilePhoto,
      required this.users,
  });
  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "id": id,
        "points": points,
        "commentCount": commentCount,
        "shareCount": shareCount,
        "title": title,
        "caption": caption,
        "videoUrl": videoUrl,
        "thumbnail": thumbnail,
        "profilePhoto": profilePhoto,
        "users":users
      };
  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Video(
        username: snapshot["username"],
        uid: snapshot["uid"],
        id: snapshot["id"],
        points: snapshot["points"],
        commentCount: snapshot["commentCount"],
        shareCount: snapshot["shareCount"],
        title: snapshot["title"],
        caption: snapshot["caption"],
        videoUrl: snapshot["videoUrl"],
        thumbnail: snapshot["thumbnail"],
        profilePhoto: snapshot["profilePhoto"],
        users: snapshot["users"]
    );
  }
}
