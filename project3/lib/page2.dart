import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project3/widgets.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.selectedItem});
  final Widget selectedItem;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyCarousel2(),
    );
  }
}

class MyCarousel2 extends StatefulWidget {
  const MyCarousel2({super.key});

  @override
  State<MyCarousel2> createState() => _MyCarousel2State();
}

List<Widget> _items = [const FlutterLogo(), const FlutterLogo()];

class _MyCarousel2State extends State<MyCarousel2>
    with TickerProviderStateMixin {
  late AnimationController _mainAnimCntrl;

  late Animation<double> _rotateAnim1;
  late Animation<double> _rotateAnim2;

  late Animation<double> _translateXAnim;
  late Animation<double> _translateXAnim2;

  static const double _cardsTravelDestence = 30;

  @override
  void initState() {
    _mainAnimCntrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _rotateAnim1 = Tween<double>(begin: 0.0, end: pi / 2).animate(
        CurvedAnimation(
            parent: _mainAnimCntrl, curve: const Interval(0.0, .5)));
    _rotateAnim2 = Tween<double>(begin: pi / 2, end: 0.0).animate(
        CurvedAnimation(
            parent: _mainAnimCntrl, curve: const Interval(0.5, 1.0)));

    _translateXAnim = Tween<double>(begin: 0.0, end: _cardsTravelDestence)
        .animate(CurvedAnimation(
            parent: _mainAnimCntrl, curve: const Interval(0.0, .5)));
    _translateXAnim2 = Tween<double>(begin: _cardsTravelDestence, end: 0.0)
        .animate(CurvedAnimation(
            parent: _mainAnimCntrl, curve: const Interval(0.5, 1.0)));

    super.initState();
  }

  @override
  void dispose() {
    _mainAnimCntrl.dispose();
    super.dispose();
  }

  MyCardsDragDirection _dragDirection = MyCardsDragDirection.right;
  List<Widget> rawItems = [
    Container(
      width: 400,
      height: 400,
      color: Colors.pinkAccent,
      child: const Text("1"),
    ),
    Container(
        width: 400,
        height: 400,
        color: Colors.lightGreenAccent,
        child: const Text("2")),
    Container(
        width: 400,
        height: 400,
        color: Colors.blueAccent,
        child: const Text("2")),
    Container(
        width: 400,
        height: 400,
        color: Colors.yellowAccent,
        child: const Text("2")),
  ];

  @override
  Widget build(BuildContext context) {
    List x = _carsGenerator();
    return Column(
      children: [
        Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            FloatingActionButton(onPressed: () async {
              _rotateAnim1 = Tween<double>(begin: 0.0, end: pi / 2).animate(
                  CurvedAnimation(
                      parent: _mainAnimCntrl, curve: const Interval(0.0, .5)));
              _rotateAnim2 = Tween<double>(begin: pi / 2, end: 0.0).animate(
                  CurvedAnimation(
                      parent: _mainAnimCntrl, curve: const Interval(0.5, 1.0)));

              _translateXAnim = Tween<double>(
                      begin: 0.0, end: _cardsTravelDestence)
                  .animate(CurvedAnimation(
                      parent: _mainAnimCntrl,
                      curve: const Interval(0.0, .5, curve: Curves.easeOut)));
              _translateXAnim2 = Tween<double>(
                      begin: _cardsTravelDestence, end: 0.0)
                  .animate(CurvedAnimation(
                      parent: _mainAnimCntrl,
                      curve: const Interval(0.5, 1.0, curve: Curves.easeIn)));

              setState(() {
                _dragDirection = MyCardsDragDirection.right;
              });

              await _mainAnimCntrl.forward();
              _mainAnimCntrl.reset();
              setState(() {
                Widget temp = rawItems.last;

                rawItems.removeLast();
                rawItems.insert(0, temp);
              });
            }),
            FloatingActionButton(onPressed: () async {
              _rotateAnim1 = Tween<double>(begin: 0.0, end: -pi / 2).animate(
                  CurvedAnimation(
                      parent: _mainAnimCntrl, curve: const Interval(0.0, .5)));
              _rotateAnim2 = Tween<double>(begin: -pi / 2, end: 0.0).animate(
                  CurvedAnimation(
                      parent: _mainAnimCntrl, curve: const Interval(0.5, 1.0)));
              _translateXAnim = Tween<double>(
                      begin: 0.0, end: -_cardsTravelDestence)
                  .animate(CurvedAnimation(
                      parent: _mainAnimCntrl,
                      curve: const Interval(0.0, .5, curve: Curves.easeOut)));
              _translateXAnim2 = Tween<double>(
                      begin: -_cardsTravelDestence, end: 0.0)
                  .animate(CurvedAnimation(
                      parent: _mainAnimCntrl,
                      curve: const Interval(0.5, 1.0, curve: Curves.easeIn)));

              setState(() {
                _dragDirection = MyCardsDragDirection.left;
              });

              await _mainAnimCntrl.forward();
              _mainAnimCntrl.reset();
              setState(() {
                Widget temp = rawItems.last;

                rawItems.removeLast();
                rawItems.insert(0, temp);
              });
            }),
          ]),
        ),
        Center(child: Stack(children: [...x])),
      ],
    );
  }

  List<Widget> _carsGenerator() {
    List<Widget> res = [
      AnimatedBuilder(
        animation: _mainAnimCntrl,
        builder: ((context, child) {
          print(_dragDirection);
          bool myConditionAnim1 = _dragDirection == MyCardsDragDirection.right
              ? _rotateAnim1.value == pi / 2
              : _rotateAnim1.value == -(pi / 2);
          bool myConditionAnim2 = _dragDirection == MyCardsDragDirection.right
              ? _rotateAnim2.value == (pi / 2)
              : _rotateAnim2.value == -(pi / 2);
          return Stack(
            children: [
              Visibility(
                visible: !(myConditionAnim1),
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4(
                      1.0,
                      0,
                      0,
                      0,
                      0,
                      1.0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0.0015,
                      _translateXAnim.value,
                      0,
                      0,
                      1,
                    )..rotateY(_rotateAnim1.value),
                    child: rawItems[0]),
              ),
              Visibility(
                visible: !(myConditionAnim1),
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4(
                      1.0,
                      0,
                      0,
                      0,
                      0,
                      1.0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0.0015,
                      -_translateXAnim.value,
                      0,
                      0,
                      1,
                    )..rotateY(_rotateAnim1.value),
                    child: rawItems[1]),
              ),
              Visibility(
                visible: !(myConditionAnim2),
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4(
                      1.0,
                      0,
                      0,
                      0,
                      0,
                      1.0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0.0015,
                      -_translateXAnim2.value,
                      0,
                      0,
                      1,
                    )..rotateY(-_rotateAnim2.value),
                    child: rawItems[1]),
              ),
              Visibility(
                visible: !(myConditionAnim2),
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4(
                      1.0,
                      0,
                      0,
                      0,
                      0,
                      1.0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0.0015,
                      _translateXAnim2.value,
                      0,
                      0,
                      1,
                    )..rotateY(-_rotateAnim2.value),
                    child: rawItems[0]),
              ),
            ],
          );
        }),
      ),
    ];
    return res;
  }
}

// [AnimatedBuilder(
//           animation: _rotateAnimCntrl,
//           builder: ((context, child) {
//             double x = _translateXAnim.value;
//             double hFormula = (-4 * (pow(x, 2)) + (x * 4));

//             if (hFormula > 0.9 && hasReachedToActivationLimit == false) {
//               hasReachedToActivationLimit = true;
//               // rawItems = rawItems.reversed.toList();
//               keys.reversed.toList();
//               print("<on9>");
//             } else if (hFormula < 0.9 && hasReachedToActivationLimit == true) {
//               hasReachedToActivationLimit = false;

//               firstOnTop != firstOnTop;
//               print("<off9>");
//             }

//             return Transform.translate(
//               offset: Offset(hFormula * 100, 0),
//               child: rawItems[0],
//             );
//           })),
//       AnimatedBuilder(
//           animation: _rotateAnimCntrl,
//           builder: ((context, child) {
//             double x = _translateXAnim.value;
//             double hFormula = -(-4 * (pow(x, 2)) + (x * 4));
//             return Transform.translate(
//               offset: Offset(hFormula * 100, 0),
//               child: rawItems[1],
//             );
//           })),]
