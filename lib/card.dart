import 'package:flutter/material.dart';

class Cardd extends StatelessWidget {

String  ?text1;
String  ?text2;
Cardd({required this.text1,required this.text2});
  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 5,
      color: Colors.white,

      child: Column(children: [
        CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/download (2).jpg",)),

       Text("$text1",
            style: TextStyle(
              fontFamily: "MyLove",
                fontSize: 30,
                color: Colors.black)),

        Text("$text2",
          style: const TextStyle( fontFamily: "MyLove",
              fontSize: 25,
              color: Colors.black),),
      ]),
    );
  }
}

