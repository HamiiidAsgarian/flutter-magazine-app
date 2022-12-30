import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/page2.dart';
import 'package:project3/widgets.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Page2(
      selectedItem:
          Container(width: 200, height: 400, color: Colors.pinkAccent),
    ));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  static const List myColors = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.pinkAccent,
    Colors.blueAccent
  ];

  // late AnimationController _animCntrl1;

  // late Animation _pageChangeAnim;

  @override
  void initState() {
    // _animCntrl1 = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 400));

    // _pageChangeAnim = Tween<double>(begin: 0, end: 300)
    //     .animate(CurvedAnimation(parent: _animCntrl1, curve: Curves.linear));
    super.initState();
  }

  static const double _cardWith = 400;
  static const double _cardHeight = 400;

  bool test = false;
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    final List<Widget> _items = [
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: myColors[0],
          width: _cardWith,
          height: _cardHeight,
          child: Image.asset("assets/images/1.png"),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            color: myColors[1],
            width: _cardWith,
            height: _cardHeight,
            child: Image.asset("assets/images/10.png"),
          ),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            color: myColors[2],
            width: _cardWith,
            height: _cardHeight,
            child: Image.asset("assets/images/9.gif"),
          ),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            color: Colors.white.withOpacity(0.5),
            width: _cardWith,
            height: _cardHeight,
            child: Image.asset("assets/images/8.png"),
          ),
        ),
      ),
      Container(
        color: Colors.limeAccent,
        width: _cardWith,
        height: _cardHeight,
        child: const Text("7"),
      ),
    ];

    log("bild");
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              myColors[_selectedIndex - 1],
              Colors.white,
            ])),
        child: Column(
          children: [
            FloatingActionButton(onPressed: () {
              setState(() {
                test = !test;
              });
            }),
            Center(
              child: MyCustomCards(
                currentIndex: (p0) {
                  print(p0);
                  setState(() {
                    _selectedIndex = p0;
                  });
                },
                items: _items,
                onTap: (status) {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: ((context, animation, secondaryAnimation) {
                          return Page2(selectedItem: _items[_selectedIndex]);
                        }),
                        transitionDuration: const Duration(seconds: 1),
                        reverseTransitionDuration: Duration.zero,
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
