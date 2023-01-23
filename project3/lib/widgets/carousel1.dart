import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/item_class.dart';
import 'package:project3/screens/page2.dart';
import 'package:project3/widgets/widgets.dart';

import 'dart:developer';

class CarouselSection extends StatelessWidget {
  const CarouselSection({
    Key? key,
    required this.cardItems,
  }) : super(key: key);

  final List<MyCarouselItem> cardItems;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            clipBehavior: Clip.none,
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
                            image: ExactAssetImage(
                                'assets/images/bb6.png'), //Defult blures background
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(width: 3),
                          borderRadius: BorderRadius.circular(3)),
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
              Align(
                alignment: const Alignment(.0, -1),
                // top: -0,
                // right: 10,
                // alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 12.5, bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 255, 243, 110),
                      border: Border.all(
                          width: 3,
                          color: const Color.fromARGB(255, 22, 22, 22))),
                  // width: 150,
                  // height: 50,
                  child: const Text(
                    "Today's Heroes",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: Carousel1(items: cardItems)),
            ],
          ),
        ));
  }
}

class Carousel1 extends StatefulWidget {
  const Carousel1({required this.items, super.key});

  final List<MyCarouselItem> items;

  @override
  State<Carousel1> createState() => _Carousel1State();
}

class _Carousel1State extends State<Carousel1> {
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
    // print(widget.items.length);
    // _animCntrl1 = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 400));

    // _pageChangeAnim = Tween<double>(begin: 0, end: 300)
    //     .animate(CurvedAnimation(parent: _animCntrl1, curve: Curves.linear));
    super.initState();
  }

  // static const double _cardWith = 400;
  // static const double _cardHeight = 400;

  // bool test = false;
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    // final List<Widget> widgetedItems = widget.items
    //     .map(
    //       (e) => SizedBox(
    //         // color: myColors[0],
    //         width: _cardWith,
    //         height: _cardHeight,
    //         child: Image.asset(e.backgroundImageUrl ?? ""),
    //       ),
    //     )
    //     .toList();

    log("bild");

    // print("1- ${widget.items[0].titel}");
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: MyCustomCards(
        itemss: widget.items,
        currentIndex: (index) {
          setState(() {
            _selectedIndex = index - 1;
          });
        },
        // items: widgetedItems,
        onTap: (status) {
          print(_selectedIndex);
          // await Future.delayed(Duration(seconds: 1));
          // Navigator.push(
          //     context,
          //     PageRouteBuilder(
          //       pageBuilder: ((context, animation, secondaryAnimation) {
          //         return Page2(selectedItem: widget.items[_selectedIndex - 1]);
          //       }),
          //       transitionDuration: const Duration(seconds: 1),
          //       reverseTransitionDuration: Duration.zero,
          //     )).then((value) {});
        },
      ),
    );
  }
}
