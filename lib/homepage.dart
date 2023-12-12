import 'package:api/apiservice.dart';
import 'package:api/card.dart';
import 'package:api/provider/wprovider.dart';
import 'package:api/wea.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  WeatherResponse? weather2;

  String city;

  HomePage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    weather2 = Provider.of<Wprovider>(context, listen: true).weather2;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 121, 0, 202),
      body: FutureBuilder(
          future: ApiService.service.fetchWeather(city: city),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
              WeatherResponse _weather = snapshot.data!;
              WeatherResponse weather2 = snapshot.data!;
              return SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: 60),
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            city,
                            style: const TextStyle(fontFamily: "MyLove",
                                fontSize: 35,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.location_on_outlined,
                                color: Color.fromARGB(255, 248, 248, 248),
                              )),
                          Text(
                            weather2.sys!.country!,
                            style: const TextStyle(fontFamily: "MyLove",
                                fontSize: 40,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(weather2.main!.temp!.toString(),
                              style: const TextStyle(fontFamily: "MyLove",
                                  fontSize: 40,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          const SizedBox(
                            width: 5,
                          ),
                          // const Text("c",
                          //     style: TextStyle(
                          //         fontSize: 40,
                          //         color: Color.fromARGB(255, 255, 255, 255))),
                          (weather2.main!.temp! > 40)
                              ? CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("images.jpg",))
                              :(weather2.main!.temp! > 30)? CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("assets/download (1).jpg",)):CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/download (2).jpg",)),
                
                
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(indent: 20,
                    endIndent: 20,
                    color: Color.fromARGB(246, 255, 255, 255),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 200,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                        const SizedBox(
                          height: 20,
                        ),
                
                
                            Cardd(text1: "Temp", text2:"${weather2.main!.temp!.toString()}"),
                            Cardd(text1: "Min", text2:"${weather2.main!.tempMin.toString()}"),
                            Cardd(text1: "Max", text2:"${weather2.main!.tempMax!.toString()}"),
                            Cardd(text1: "Clouds", text2:"${weather2.clouds!.all}"),
                            Cardd(text1: "Visabilty", text2:"${weather2.visibility!}"),
                
                      ]),
                    ),
                
                
                
                
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                
                
                          Cardd(text1: "Hum", text2:"${weather2.main!.humidity!}"),
                          Cardd(text1: "SunRise", text2:"${weather2.sys!.sunrise!}"),
                          Cardd(text1: "SunSet", text2:"${weather2.sys!.sunset!}"),
                          Cardd(text1: "lat", text2:"${weather2.coord!.lat}"),
                          Cardd(text1: "lon", text2:"${weather2.coord!.lon!
                          }"),
                
                        ]),
                  ),
                
                
                
                
                
                
                
                
                
                ]),
              );
            } else if (snapshot.hasError) {
              return const Text(
                "Error",
                style: TextStyle(
                    color: Color.fromARGB(255, 226, 10, 3), fontSize: 40),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
