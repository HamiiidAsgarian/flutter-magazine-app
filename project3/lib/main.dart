import 'dart:math';
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

          Transform(
            transform: Matrix4.skewX(0),
            child: Container(
              height: 200,
              color: Colors.pink,
              width: double.infinity,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                // Center(
                //   child: ClipPath(
                //     clipper: SkewCut(),
                //     child: Container(
                //       color: Color.fromARGB(255, 54, 244, 86),
                //       // width: 200,
                //       // height: 50,
                //       child: Center(child: Text("Hello World")),
                //     ),
                //   ),
                // ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: ClipPath(
                //     clipper: SkewCut2(),
                //     child: Container(
                //       color: Color.fromARGB(255, 244, 177, 54),
                //       // width: 200,
                //       // height: 50,
                //       child: Center(child: Text("Hello World")),
                //     ),
                //   ),
                // ),

                Container(
                  // color: Colors.black,
                  width: 200,
                  height: 10,
                  child: CustomPaint(
                    size: Size(50.0,
                        50.0), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RPSCustomPainter(),
                  ),
                ),
                Container(
                  // color: Colors.black,
                  width: 200,
                  height: 10,
                  child: CustomPaint(
                    size: Size(50.0,
                        50.0), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RPSCustomPainter(),
                    child: Stack(children: [
                      ClipPath(
                          clipper: SkewCut2(),
                          child: Image.asset("images/f1.png"))
                    ]),
                  ),
                ),
                // Container(
                //   color: Color.fromARGB(255, 218, 218, 218),

                //   // width: 100,
                //   child: Image.asset("/t/2.png"),
                // ),
                // Container(
                //   color: Color.fromARGB(255, 131, 131, 131),

                //   // width: 100,
                //   child: Image.asset("/t/3.png"),
                // ),
                // Container(
                //   color: Colors.black,

                //   // width: 100,
                //   child: Image.asset("/t/4.png"),
                // )
              ]),
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
        Container(
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
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.7942440);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width * 0.3097017, 0);
    path_0.lineTo(size.width * 0.8545011, size.height * 0.2716143);
    path_0.lineTo(size.width, size.height * 0.7942440);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.red.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SkewCut extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, 0);
    path.lineTo(50, 0);
    path.lineTo(30, 50);

    // path.lineTo(size.width - 20, size.height);
    // path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(SkewCut oldClipper) => false;
}

class SkewCut2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, 0);
    path.lineTo(100, 0);
    path.lineTo(100, 100);

    // path.lineTo(size.width - 20, size.height);
    // path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(SkewCut oldClipper) => false;
}
