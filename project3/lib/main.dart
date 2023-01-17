import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/carousel1.dart';
import 'package:project3/item_class.dart';
import 'package:project3/other_characters.dart';
import 'package:project3/shapes.dart';

import 'appbar_navbar.dart';

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
      home: HomeScreen(
          carouselItems: carouselsData, otherHeroesItems: otherHeroesData),
      //     home: Page2(
      //   selectedItem:
      //       Container(width: 200, height: 400, color: Colors.pinkAccent),
      // )
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {required this.carouselItems, super.key, required this.otherHeroesItems});

  final List<MyCarouselItem> carouselItems;
  final List<MyListItem> otherHeroesItems;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CustomPaint> otherHeroesItems = [];

  @override
  void initState() {
    otherItemsGenerator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 253, 234, 8),
        // bottomNavigationBar: const MyNavbar(),
        // appBar: const MyAppbar(),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(255, 253, 234, 8),
                Color.fromARGB(255, 218, 218, 218)
              ])),
          child: Column(
            children: [
              // const GeanraSection(),
              CarouselSection(cardItems: widget.carouselItems),
              // OtherCharactersSection(items: otherHeroesItems)
            ],
          ),
        ),
      ),
    );
  }

  otherItemsGenerator() {
    for (var i = 0; i < widget.otherHeroesItems.length; i++) {
      if (i == 0) {
        otherHeroesItems.add(customCardGenerator(
            painter: Shape1(color: Colors.black),
            clipper: Clip1(),
            imageUrl: widget.otherHeroesItems[i].fullImage));
      } else if ((i + 1) % 3 == 0) {
        otherHeroesItems.add(customCardGenerator(
            painter: Shape3(color: Colors.black),
            clipper: Clip3(),
            imageUrl: widget.otherHeroesItems[i].fullImage));
      } else if ((i + 1) % 5 == 0) {
        otherHeroesItems.add(customCardGenerator(
            painter: Shape5(color: Colors.black),
            clipper: Clip5(),
            imageUrl: widget.otherHeroesItems[i].fullImage));
      } else if ((i + 1) % 2 == 0) {
        otherHeroesItems.add(customCardGenerator(
            painter: Shape2(color: Colors.black),
            clipper: Clip2(),
            imageUrl: widget.otherHeroesItems[i].fullImage));
      }
    }
  }
}

customCardGenerator({
  CustomPainter? painter,
  String? imageUrl,
  CustomClipper<Path>? clipper,
}) {
  return CustomPaint(
      painter: painter,
      child: ClipPath(
          clipper: clipper,
          child: Transform.scale(
            scale: 1.5,
            child: Image.asset(
              imageUrl ?? "",
              fit: BoxFit.fill,
            ),
          )));
}

class GeanraSection extends StatelessWidget {
  const GeanraSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 7.1,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          height: 50,
          width: double.infinity,
          // color: Colors.green.withOpacity(.1),
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: GeanrasShape(color: Colors.pink),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Transform(
                  transform: Matrix4(
                    // 2.85, -.0, 0, 0.005, //
                    1, -.07, 0, 0.0, //
                    0, 1, 0, 0, //
                    0, 0, 1, 0.01, //
                    0, 0, 0, 1,
                  ) //NOTE
                  ,
                  child: Container(
                    decoration: const BoxDecoration(
                        // color: const Color.fromARGB(255, 255, 62, 62),
                        // border: Border.all(
                        //     width: 3, color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                    // padding: EdgeInsets.symmetric(horizontal: 10),
                    height: double.infinity,
                    child: ListView(
                      itemExtent: 100,
                      scrollDirection: Axis.horizontal,
                      children: [
                        'Marvel Comics',
                        "DC Comics",
                        "Anime",
                        "Manga",
                        "Cartoon"
                      ]
                          .map((e) => TextButton(
                                onPressed: (() {}),
                                child: Text(e),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
