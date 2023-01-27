import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/item_class.dart';
import 'package:project3/screens/page2.dart';
import 'package:project3/widgets/widgets_and_sections.dart';

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
                      1, -.11, 0, 0.0, // this is for skew of the section
                      0, 1, 0, 0, //
                      0, 0, 1, 0, //
                      0, 0, 0, 1,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: ExactAssetImage(
                                'assets/images/bb6.png'), //Defult blured background
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
                alignment: const Alignment(.9, -1),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 12.5, bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 253, 234, 8),
                      border: Border.all(
                          width: 3,
                          color: const Color.fromARGB(255, 22, 22, 22))),
                  child: const Text(
                    "Saved Heroes",
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
  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    log("bild");

    // print("1- ${widget.items[0].titel}");
    return MyCustomCards(
      items: widget.items,
      currentIndex: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      onTap: (status) async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => Page2(
                      //
                      selectedItem: widget.items[_currentIndex],
                    )))).then((value) {
          MyCustomCards.myCarousleKey.currentState!
              .cardOpening(); //NOTE i have created a global key inside the [MyCustomCards]  widget to access its methods from here to be more organized, however this might reduce stability
        });
      },
    );
  }
}
