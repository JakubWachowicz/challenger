import 'package:challenger/controllers/search_users_controller.dart';
import 'package:challenger/models/video.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../models/user.dart';

class Leaderboard extends StatefulWidget {



  List<User> players;
  Leaderboard({required this.players});

  @override
  State<Leaderboard> createState() => _LeaderboardState();


  SearchController searchController = SearchController();





  List<User> getPlayers(){


    searchController.searchUser();
    return searchController.searchedUsers;
  }


}

class _LeaderboardState extends State<Leaderboard> {
 var lol = firestore.collection("users");


 @override
  void initState() {
    // TODO: implement initState


    super.initState();

  }



  @override
  Widget build(BuildContext context) {




    return Obx((){




                return Container(
                  decoration: const BoxDecoration(
                      color: backGroundColor
                  ),
                  child: ListView.builder(
                    itemCount:  searchVideos().length   ,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      searchVideos()[index].username,
                                      style: TextStyle(color: textColor),

                                    ),

                                    SizedBox(width: 20,),
                                    Text(
                                      searchVideos()[index].title,
                                      style: TextStyle(color: textColor),

                                    ),

                                    SizedBox(width: 20,),

                                    Text(
                                      searchVideos()[index].points,
                                      style: TextStyle(color: textColor),

                                    ),
                                    SizedBox(width: 10,),
                                    ElevatedButton(onPressed: (){}, child: Icon(Icons.search), style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                    ),),


                                  ],
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

    );
  }

 List<User> get searchedUsers => _searchedUsers.value;

 final Rx<List<User>> _searchedUsers = Rx<List<User>>([]);


 List<Video> get searchedVideos => _searchedVideos.value;

 final Rx<List<Video>> _searchedVideos = Rx<List<Video>>([]);


 List<User> searchUser()  {
   _searchedUsers.bindStream(firestore
       .collection('users')
       .snapshots()
       .map((QuerySnapshot query) {
     List<User> retVal = [];
     for (var elem in query.docs) {
       retVal.add(User.fromSnap(elem));
     }
     return retVal;
   }));




   return searchedUsers;
 }


 int mySortComparison(Video a, Video b) {
   final propertyA = int.parse(a.points);
   final propertyB =int.parse(b.points);
   if (propertyA < propertyB) {
     return -1;
   } else if (propertyA > propertyB) {
     return 1;
   } else {
     return 0;
   }
 }




 List<Video> searchVideos()  {
   _searchedVideos.bindStream(firestore
       .collection('videos')
       .snapshots()
       .map((QuerySnapshot query) {
     List<Video> retVal = [];
     for (var elem in query.docs) {
       retVal.add(Video.fromSnap(elem));
     }
     return retVal;
   }));


   searchedVideos.sort(mySortComparison);
   return searchedVideos;
 }



 initMyContext() {

    searchUser();
    searchVideos();
  }
}
