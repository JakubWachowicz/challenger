import 'package:challenger/controllers/search_users_controller.dart';
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
                    itemCount:  searchUser().length   ,
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
                                  searchUser()[index].name,
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

    );
  }

 List<User> get searchedUsers => _searchedUsers.value;

 final Rx<List<User>> _searchedUsers = Rx<List<User>>([]);





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

  initMyContext() {

    searchUser();
  }
}
