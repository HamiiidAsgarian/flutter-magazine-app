import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/item_class.dart';
import 'package:project3/page2.dart';
import 'package:project3/widgets.dart';

import 'dart:developer';

class Carousel1 extends StatefulWidget {
  const Carousel1({required this.items, super.key});

  final List<MyCardItem> items;

  @override
  State<Carousel1> createState() => _Carousel1State();
}

class _Carousel1State extends State<Carousel1>
    with SingleTickerProviderStateMixin {
  // static final List myColors = [
  //   Colors.white.withOpacity(0),
  //   Colors.white.withOpacity(0),
  //   Colors.white.withOpacity(0),
  //   Colors.white.withOpacity(0),
  //   Colors.white.withOpacity(0),
  // ];

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
    final List<Widget> widgetedItems = widget.items
        .map(
          (e) => Container(
            // color: myColors[0],
            width: _cardWith,
            height: _cardHeight,
            child: Image.asset(e.backgroundImageUrl ?? ""),
          ),
        )
        .toList();

    log("bild");
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: MyCustomCards(
        itemss: widget.items,
        currentIndex: (p0) {
          setState(() {
            _selectedIndex = p0;
          });
        },
        items: widgetedItems,
        onTap: (status) {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: ((context, animation, secondaryAnimation) {
                  return Page2(selectedItem: widgetedItems[_selectedIndex]);
                }),
                transitionDuration: const Duration(seconds: 1),
                reverseTransitionDuration: Duration.zero,
              ));
        },
      ),
    );
  }
}
