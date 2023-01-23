import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/item_class.dart';
import 'package:project3/screens/page2.dart';
import 'package:project3/screens/page_home.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static Map<String, dynamic> data = MyCarouselItem.data;

  @override
  Widget build(BuildContext context) {
    List<MyCarouselItem> carouselsData = [];
    List<MyListItem> otherHeroesData = [];

    for (var e in data['carousels']) {
      carouselsData.add(MyCarouselItem.fromMap(e));
    }
    for (var e in data['otherHeroes']) {
      otherHeroesData.add(MyListItem.fromMap(e));
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "avengers",
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          )),
        ),
        scrollBehavior: MyCustomScrollBehavior(),
        // home: HomeScreen(
        //     carouselItems: carouselsData, otherHeroesItems: otherHeroesData),
        home: HomeScreen(
          carouselItems: carouselsData,
          otherHeroesItems: otherHeroesData,
        ));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
