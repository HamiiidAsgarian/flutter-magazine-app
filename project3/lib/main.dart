import 'dart:math';
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

  static List<Map<String, dynamic>> data = MyCardItem.data;

  @override
  Widget build(BuildContext context) {
    List<MyCardItem> serilizedData = data
        .map(
          (e) => MyCardItem.fromMap(e),
        )
        .toList();

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
      home: HomeScreen(cardItems: serilizedData),
      //     home: Page2(
      //   selectedItem:
      //       Container(width: 200, height: 400, color: Colors.pinkAccent),
      // )
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.cardItems, super.key});

  final List<MyCardItem> cardItems;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List shapes = [
    CustomPaint(
        painter: Shape1(color: Colors.black),
        child: ClipPath(
            clipper: Clip1(),
            child: Transform.scale(
              scale: 1.5,
              child: Image.asset(
                "assets/images/i1.png",
                fit: BoxFit.fill,
              ),
            ))),
    CustomPaint(
        painter: Shape2(color: Colors.black),
        child: ClipPath(
            clipper: Clip2(),
            child: Transform.scale(
              scale: 1.5,
              child: Image.asset(
                "assets/images/i2.png",
                fit: BoxFit.fill,
              ),
            ))),
    CustomPaint(
        painter: Shape3(color: Colors.black),
        child: ClipPath(
            clipper: Clip3(),
            child: Transform.scale(
              scale: 1.5,
              child: Image.asset(
                "assets/images/i4.png",
                fit: BoxFit.fill,
              ),
            ))),
    CustomPaint(
        painter: Shape2(color: Colors.black),
        child: ClipPath(
            clipper: Clip2(),
            child: Transform.scale(
              scale: 1.5,
              child: Image.asset(
                "assets/images/i3.png",
                fit: BoxFit.fill,
              ),
            ))),
    CustomPaint(
        painter: Shape5(color: Colors.black),
        child: ClipPath(
            clipper: Clip5(),
            child: Transform.scale(
              scale: 1.5,
              child: Image.asset(
                "assets/images/i5.png",
                fit: BoxFit.fill,
              ),
            ))),
    CustomPaint(
        painter: Shape3(color: Colors.black),
        child: ClipPath(
            clipper: Clip3(),
            child: Transform.scale(
              scale: 1.5,
              child: Image.asset(
                "assets/images/i6.png",
                fit: BoxFit.fill,
              ),
            ))),
    CustomPaint(
        painter: Shape2(color: Colors.black),
        child: ClipPath(
            clipper: Clip2(),
            child: Transform.scale(
              scale: 1.5,
              child: Image.asset(
                "assets/images/i7.png",
                fit: BoxFit.fill,
              ),
            ))),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 219, 219, 219),
        bottomNavigationBar: const MyNavbar(),
        appBar: const MyAppbar(),
        body: Column(
          children: [
            const GeanraSection(),
            CarouselSection(cardItems: widget.cardItems),
            // const SizedBox(height: 50),
            OtherCharactersSection(shapes: shapes)
          ],
        ),
      ),
    );
  }
}

class GeanraSection extends StatelessWidget {
  const GeanraSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      height: 50,
      width: double.infinity,
      color: Colors.green.withOpacity(.1),
      padding: const EdgeInsets.symmetric(horizontal: 11.5),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: GeanrasShape(color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2),
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
                decoration: BoxDecoration(
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
                    TextButton(
                        onPressed: (() {}), child: const Text("Marvel Comics")),
                    TextButton(
                        onPressed: (() {}), child: const Text("DC Comics")),
                    TextButton(onPressed: (() {}), child: const Text("Anime")),
                    TextButton(onPressed: (() {}), child: const Text("Manga")),
                    TextButton(onPressed: (() {}), child: const Text("Cartoon"))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
