
import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({super.key});

  void dispose() {}
  AppBar getAppBar(
      {Key ?key,
    Widget ?title,
    BuildContext ?context,
    int ?countOfDraftContent,
    int ?countOfSyncContent}) {
    return AppBar(
      backgroundColor: Colors.white,
        key: key,
        automaticallyImplyLeading: false,
        actions: const <Widget>[
         Padding(
           padding: EdgeInsets.only(right:8.0),
           child: Icon(Icons.more_vert,color: Colors.black),
         )
        ],
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context!);
          },
            child: const Icon(Icons.arrow_back_ios,color: Colors.black,
            )),
        title:  const Text("Baby Shop",style: TextStyle(color: Colors.black),),
        );
  }
}