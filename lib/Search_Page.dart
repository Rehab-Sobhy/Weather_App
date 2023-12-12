import 'package:api/apiservice.dart';
// import 'package:api/homepage.dart';

import 'package:api/wea.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

// ignore: must_be_immutable
class Search_Page extends StatelessWidget {

  Search_Page({super.key});

  String? city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 77, 0, 126),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
                radius: 90,
               backgroundImage: AssetImage("assets/OIP.jpg",)),
            SizedBox(height: 5,),
            const Text(
              " Search Now  ",
              style: TextStyle( fontFamily: "MyLove",
                  color: Color.fromARGB(225, 255, 253, 253), fontSize: 40),
            ),
            Container(
              margin: const EdgeInsets.all(50),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: TextField(
                  onSubmitted: (value) async {
                    city = value;
                    ApiService service = ApiService.service;
                    // ignore: unused_local_variable
                    WeatherResponse weather =
                        await service.fetchWeather(city: city!);



                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  city: city!,
                                )));
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22)),
                    enabled: true,
                    fillColor: const Color.fromARGB(255, 247, 244, 248),
                    labelText: "City",
                    labelStyle:
                        const TextStyle(color: Colors.white70, fontSize: 35,),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    iconColor: const Color.fromARGB(179, 245, 236, 236),
                    // filled: true,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
