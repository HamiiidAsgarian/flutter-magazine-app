import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/item_class.dart';
import 'package:project3/page2.dart';
import 'package:project3/widgets.dart';

import 'dart:developer';

class CarouselSection extends StatelessWidget {
  const CarouselSection({
    Key? key,
    required this.cardItems,
  }) : super(key: key);

  final List<MyCardItem> cardItems;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            // color: Colors.green,
            child: Stack(
              // padding: EdgeInsets.symmetric(horizontal: 25),
              children: [
                Container(
                  // color: Colors.blue,
                  margin: const EdgeInsets.only(top: 0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Transform(
                      transform: Matrix4(
                        1, -.11, 0, 0.0, //
                        0, 1, 0, 0, //
                        0, 0, 1, 0, //
                        0, 0, 0, 1,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: ExactAssetImage('assets/images/bb6.png'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(width: 3),
                        ),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 010, sigmaY: 010),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Carousel1(items: cardItems)),
                const Center(child: FlutterLogo()),
              ],
            ),
          ),
        ));
  }
}

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
          (e) => SizedBox(
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
