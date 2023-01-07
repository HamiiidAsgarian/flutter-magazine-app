import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/carousel1.dart';
import 'package:project3/item_class.dart';
import 'package:project3/page2.dart';
import 'package:project3/widgets.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const List<Map<String, dynamic>> data = [
    {
      "title": "Spiderman",
      "description": "frinedlySpider",
      "coverImages": {
        "backgroundImage": "assets/images/b1.png",
        "foregroundImage": "assets/images/f1.png",
        "effectImage": "assets/images/e1.png",
        "fullImage": "assets/images/c1.png"
      }
    },
    {
      "title": "Capitan",
      "description": "cap",
      "coverImages": {
        "backgroundImage": "assets/images/b2.png",
        "foregroundImage": "assets/images/f2.png",
        "effectImage": "",
        "fullImage": "assets/images/c2.png"
      }
    },
    {
      "title": "Capitan",
      "description": "cap",
      "coverImages": {
        "backgroundImage": "assets/images/b3.png",
        "foregroundImage": "assets/images/f3.png",
        "effectImage": "assets/images/e3.png",
        "fullImage": "assets/images/c3.png"
      }
    },
    {
      "title": "Capitan",
      "description": "cap",
      "coverImages": {
        "backgroundImage": "assets/images/b4.png",
        "foregroundImage": "assets/images/f4.png",
        "effectImage": "assets/images/e4.png",
        "fullImage": "assets/images/c4.png"
      }
    },
    {
      "title": "Capitan",
      "description": "cap",
      "coverImages": {
        "backgroundImage": "assets/images/b5.png",
        "foregroundImage": "assets/images/f5.png",
        "effectImage": "",
        "fullImage": "assets/images/c5.png"
      }
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<MyCardItem> serilizedData = data
        .map(
          (e) => MyCardItem.fromMap(e),
        )
        .toList();

    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      bottomNavigationBar: BottomNavigationBar(
          // selectedItemColor: Colors.black,
          unselectedItemColor: Colors.red,
          backgroundColor: Colors.green,
          fixedColor: Colors.greenAccent,
          // selectedItemColor: Colors.black,
          onTap: (value) {},
          currentIndex: 2,
          items: const [
            BottomNavigationBarItem(label: "", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.search)),
          ]),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
        leading: const CircleAvatar(radius: 50),
        title: Column(
          children: const [Text("Hello"), Text("Hamid")],
        ),
      ),
      body: Column(
        children: [
          const GeanraSection(),
          Expanded(
              flex: 4,
              child: Container(
                  color: Colors.red,
                  child: Carousel1(items: widget.cardItems))),
          Expanded(
            child: Container(
              // height: 200,
              // width: 500,
              color: Colors.brown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("others"),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: const [
                        FlutterLogo(
                          size: 500,
                        ),
                        FlutterLogo(
                          size: 500,
                        ),
                        FlutterLogo(
                          size: 500,
                        ),
                        FlutterLogo(
                          size: 500,
                        ),
                        FlutterLogo(
                          size: 500,
                        ),
                        FlutterLogo(
                          size: 500,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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
    return SizedBox(
      height: 50,
      child: ListView(
        itemExtent: 100,
        scrollDirection: Axis.horizontal,
        children: [
          TextButton(onPressed: (() {}), child: const Text("Marvel Comics")),
          TextButton(onPressed: (() {}), child: const Text("DC Comics")),
          TextButton(onPressed: (() {}), child: const Text("Anime")),
          TextButton(onPressed: (() {}), child: const Text("Manga")),
          TextButton(onPressed: (() {}), child: const Text("Cartoon"))
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
