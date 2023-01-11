import 'dart:js_util';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/carousel1.dart';
import 'package:project3/item_class.dart';
import 'package:project3/page2.dart';
import 'package:project3/shapes.dart';
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
    // {
    //   "title": "Capitan",
    //   "description": "cap",
    //   "coverImages": {
    //     "backgroundImage": "assets/images/b4.png",
    //     "foregroundImage": "assets/images/f4.png",
    //     "effectImage": "assets/images/e4.png",
    //     "fullImage": "assets/images/c4.png"
    //   }
    // },
    // {
    //   "title": "Capitan",
    //   "description": "cap",
    //   "coverImages": {
    //     "backgroundImage": "assets/images/b5.png",
    //     "foregroundImage": "assets/images/f5.png",
    //     "effectImage": "",
    //     "fullImage": "assets/images/c5.png"
    //   }
    // }
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
  ScrollController testCntrl = ScrollController();

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

          Container(
            height: 150,
            color: Colors.pink,
            width: double.infinity,
            child: Transform(
              transform: Matrix4(
                1, 0, 0, 0, //
                0, 1, 0, 0, //
                0, 0, 1, 0, //
                0, 0, 0, 1,
              ),

              // transform: Matrix4(
              //   1, -.13, 0, -0.0008, //
              //   0, 1, 0, 0, //
              //   0, 0, 1, 0, //
              //   0, 0, 0, 1,
              // )

              child: ListView.builder(
                // itemExtent: 200,
                controller: testCntrl,
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  print(testCntrl.offset);

                  return GestureDetector(
                    onTap: () {
                      print("object $index");
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(0),

                        color: Colors.black.withOpacity(.1),
                        width: 150,
                        // height: 100,
                        child: modulo(index, 2) == 0
                            ? CustomPaint(
                                // size: const Size(10.0,
                                //     10.0), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                painter: LeftBoltShape(
                                    color: modulo(index, 2) == 0
                                        ? Colors.yellow
                                        : Colors.blue),
                                child: Stack(children: [
                                  // ClipPath(
                                  //     clipper: SkewCut2(),
                                  //     child: Transform.scale(
                                  //       scale: 1.5,
                                  //       child: Image.asset(
                                  //         "images/l1.png",
                                  //         fit: BoxFit.fill,
                                  //       ),
                                  //     ))
                                ]),
                              )
                            : CustomPaint(
                                // size: const Size(10.0,
                                //     10.0), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                painter: RightBoltShape(
                                    color: modulo(index, 2) == 0
                                        ? Colors.yellow
                                        : Colors.blue),
                                child: Stack(children: [
                                  // ClipPath(
                                  //     clipper: SkewCut2(),
                                  //     child: Transform.scale(
                                  //       scale: 1.5,
                                  //       child: Image.asset(
                                  //         "images/l1.png",
                                  //         fit: BoxFit.fill,
                                  //       ),
                                  //     ))
                                ]),
                              ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
          // Expanded(
          //   child: OthersSection(),
          // )
        ],
      ),
    );
  }
}

class OthersSection extends StatelessWidget {
  const OthersSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Positioned(
            left: 50,
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.blueAccent,
            )),
        const Text("others"),
        SizedBox(
          height: 200,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                color: Colors.red,
                width: 50,
                height: 50,
              ),
              Transform(
                transform: Matrix4.skewY(50),
                child: Container(
                  color: Colors.green,
                  width: 50,
                  height: 50,
                ),
              )
            ],
          ),
        )
      ],
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

// class MyThriangle extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint();
//     // TODO: Set properties to paint

//     var path = Path();

//     // TODO: Draw your path

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//     throw UnimplementedError();
//   }
// }

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class MyThriangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final paint2 = Paint()
      ..color = Colors.amber
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    Path path_0 = Path();

    path_0.moveTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, 0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
