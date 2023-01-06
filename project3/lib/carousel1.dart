import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/page2.dart';
import 'package:project3/widgets.dart';

import 'dart:developer';

class Carousel1 extends StatefulWidget {
  const Carousel1({super.key});

  @override
  State<Carousel1> createState() => _Carousel1State();
}

class _Carousel1State extends State<Carousel1>
    with SingleTickerProviderStateMixin {
  static const List myColors = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.pinkAccent,
    Colors.blueAccent,
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
    final List<Widget> items = [
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
            child: Image.asset("assets/images/2.png"),
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
            child: Image.asset("assets/images/3.png"),
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
            child: Image.asset("assets/images/4.png"),
          ),
        ),
      ),
      Container(
        color: Colors.limeAccent,
        width: _cardWith,
        height: _cardHeight,
        child: Image.asset("assets/images/4.png"),
      ),
    ];

    log("bild");
    return AnimatedContainer(
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
                setState(() {
                  _selectedIndex = p0;
                });
              },
              items: items,
              onTap: (status) {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: ((context, animation, secondaryAnimation) {
                        return Page2(selectedItem: items[_selectedIndex]);
                      }),
                      transitionDuration: const Duration(seconds: 1),
                      reverseTransitionDuration: Duration.zero,
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
