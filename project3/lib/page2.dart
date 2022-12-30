import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project3/widgets.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.selectedItem});
  final Widget selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.center,
          child: GestureDetector(
              onTap: () {
                // Navigator.pop(context);
              },
              child: const Hero(tag: "Hero1", child: MyCarousel2()))),
    );
  }
}

class MyCarousel2 extends StatefulWidget {
  const MyCarousel2(
      {super.key,
      this.items = const [],
      this.currentIndex,
      this.onTap,
      this.leftOrRightResult});

  final List<Widget> items;
  final Function(MyCardsDragDirection)? leftOrRightResult;
  final Function(int)? currentIndex;
  final Function(CardsSelectionStatus)? onTap;

  @override
  State<MyCarousel2> createState() => _MyCarousel2State();
}

class _MyCarousel2State extends State<MyCarousel2>
    with TickerProviderStateMixin {
  late AnimationController _rotateAnimCntrl;
  // late AnimationController _returnToPositionCntrl;

  // late Animation<double> _traslateAnim;
  // late Animation<double> _traslateAnim1;
  // late Animation<double> _traslateAnim2;
  // late Animation<double> _traslateAnim3;

  late Animation<double> _rotateAnim;
  // late Animation<double> _rotateAnim1;
  // late Animation<double> _rotateAnim2;
  // late Animation<double> _rotateAnim3;

  // late Animation<Offset> _returnToOfssetPositionAnim;

  // late List<Animation<double>> _translateAnims;
  late List<Animation<double>> _rotateAnims;

  late List<Widget> _items;

  @override
  void initState() {
    _rotateAnimCntrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    // _returnToPositionCntrl = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 200));

    // _returnToOfssetPositionAnim =
    //     Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 0))
    //         .animate(CurvedAnimation(
    //             parent: _returnToPositionCntrl, curve: Curves.easeInOut));

    // _traslateAnim = Tween<double>(begin: 1, end: 0).animate(
    //     CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOut));
    // _traslateAnim1 = Tween<double>(begin: .9, end: 1).animate(
    //     CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOut));
    // _traslateAnim2 = Tween<double>(begin: .8, end: .9).animate(
    //     CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOut));
    // _traslateAnim3 = Tween<double>(begin: 0, end: .8).animate(
    //     CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOut));

    _rotateAnim = Tween<double>(begin: 0, end: pi).animate(
        CurvedAnimation(parent: _rotateAnimCntrl, curve: Curves.linear));
    // _rotateAnim1 = Tween<double>(begin: -(pi / 7), end: 0).animate(
    //     CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
    // _rotateAnim2 = Tween<double>(begin: (pi / 7), end: -(pi / 7)).animate(
    //     CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
    // _rotateAnim3 = Tween<double>(begin: 0, end: (pi / 7)).animate(
    //     CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOutBack));

    // _translateAnims = [
    //   _traslateAnim,
    //   _traslateAnim1,
    //   _traslateAnim2,
    //   _traslateAnim3,
    // ];
    _rotateAnims = [_rotateAnim];

    _items = widget.items;

    super.initState();
  }

  double _cardWith = 100;
  double _cardHeight = 100;

  @override
  void dispose() {
    _rotateAnimCntrl.dispose();
    // _returnToPositionCntrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        rotate();
      },
      child: AnimatedBuilder(
        animation: _rotateAnim,
        builder: (context, child) {
          return Transform(
              alignment: Alignment.center,
              // origin: Offset(-20, 0),

              transform: Matrix4(
                1,
                0,
                0,
                0,
                0,
                1,
                0,
                0,
                0,
                0,
                1,
                0.003,
                0,
                0,
                0,
                1,
              )..rotateY(_rotateAnim.value),

              // transform: Matrix4.identity()
              //   ..setEntry(3, 2,
              //       0.003) // col = 2, row = 3 & 0.003 = depth perception in the Z direction
              //   ..rotateY(_rotateAnim.value),
              child: Container(
                  width: _cardWith, height: 400, color: Colors.greenAccent));
        },
      ),
      onTap: () {},
    );
  }

  rotate() async {
    await _rotateAnimCntrl.forward();
    // await _rotateAnimCntrl.reverse();
  }

  static Matrix4 _perspective() {
    double pv = 1.0;

    return Matrix4(
      1.0, 0.0, 0.0, 0.0, //
      0.0, 1.0, 0.0, 0.0, //
      0.0, 0.0, 1.0, pv * 0.001, //
      0.0, 0.0, 0.0, 1.0,
    );
  }
}
