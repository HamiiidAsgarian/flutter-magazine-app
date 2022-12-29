import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/widgets.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animCntrl1;

  late Animation _pageChangeAnim;

  @override
  void initState() {
    _animCntrl1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    _pageChangeAnim = Tween<double>(begin: 0, end: 300)
        .animate(CurvedAnimation(parent: _animCntrl1, curve: Curves.linear));
    super.initState();
  }

  static const double _cardWith = 350;
  static const double _cardHeight = 500;
  final List<Widget> _items = [
    const FlutterLogo(
      size: 900,
    ),
    Container(
      color: Colors.blue,
      width: 800,
      height: 900,
      child: const Text("3"),
    ),
    Container(
      color: Colors.pinkAccent,
      width: _cardWith,
      height: _cardHeight,
      child: const Text("4"),
    ),
    Container(
      color: Colors.brown,
      width: _cardWith,
      height: _cardHeight,
      child: const Text("5"),
    ),
    Container(
      color: Colors.lightBlue,
      width: _cardWith,
      height: _cardHeight,
      child: const Text("6"),
    ),
    Container(
      color: Colors.limeAccent,
      width: _cardWith,
      height: _cardHeight,
      child: const Text("7"),
    ),
  ];
  bool test = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              test ? Colors.red : Colors.greenAccent,
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
                items: _items,
                onTap: (status) {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: ((context, animation, secondaryAnimation) {
                          return const Page2();
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

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Hero(tag: "Hero1", child: FlutterLogo(size: 200)))),
    );
  }
}
