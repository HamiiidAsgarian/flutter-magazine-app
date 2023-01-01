import 'dart:math';

import 'package:flutter/material.dart';

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

// class MyCarousel2 extends StatefulWidget {
//   const MyCarousel2(
//       {super.key,
//       this.items = const [],
//       this.currentIndex,
//       this.onTap,
//       this.leftOrRightResult});

//   final List<Widget> items;
//   final Function(MyCardsDragDirection)? leftOrRightResult;
//   final Function(int)? currentIndex;
//   final Function(CardsSelectionStatus)? onTap;

//   @override
//   State<MyCarousel2> createState() => _MyCarousel2State();
// }

// class _MyCarousel2State extends State<MyCarousel2>
//     with TickerProviderStateMixin {
//   late AnimationController _rotateAnimCntrl;

//   late Animation<double> _rotateAnim;
//   late Animation<double> _translateXAnim;
//   late Animation<double> _scaleAnim;
//   late Animation<double> _scaleAnim2;

//   late List<Animation<double>> _rotateAnims;

//   late List<Widget> _items;

//   late List<Widget> mywid;
//   @override
//   void initState() {
//     _rotateAnimCntrl = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 5000));

//     _rotateAnim = Tween<double>(begin: 0, end: pi).animate(
//         CurvedAnimation(parent: _rotateAnimCntrl, curve: Curves.linear));

//     _scaleAnim = Tween<double>(begin: 1.0, end: 0.7).animate(
//         CurvedAnimation(parent: _rotateAnimCntrl, curve: Curves.linear));
//     _scaleAnim2 = Tween<double>(begin: .7, end: 1.0).animate(
//         CurvedAnimation(parent: _rotateAnimCntrl, curve: Curves.linear));

//     _translateXAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
//         parent: _rotateAnimCntrl,
//         curve: const Interval(0.0, 1.0, curve: Curves.linear)));

//     _rotateAnims = [_rotateAnim];

//     _items = widget.items;

//     mywid = [
//       GestureDetector(
//         onTapUp: (details) {
//           rotate();
//         },
//         child: AnimatedBuilder(
//           animation: _rotateAnim,
//           builder: (context, child) {
//             // double x = _translateXAnimGo.isCompleted
//             //     ? _translateXAnimBack.value
//             //     : _translateXAnimGo.value;
//             double x = _translateXAnim.value;
//             double res = (-4 * (pow(x, 2)) + (x * 4));

//             print(res);
//             return Transform(
//                 alignment: Alignment.center,
//                 // origin: const Offset(-20, 0),
//                 transform: Matrix4(
//                   _scaleAnim.value,
//                   0,
//                   0,
//                   0,
//                   0,
//                   _scaleAnim.value,
//                   0,
//                   0,
//                   0,
//                   0,
//                   1,
//                   0.01,
//                   res * 30,
//                   0,
//                   0,
//                   1,
//                 )..rotateY(-_rotateAnim.value),

//                 // transform: Matrix4.identity()
//                 //   ..setEntry(3, 2,
//                 //       0.003) // col = 2, row = 3 & 0.003 = depth perception in the Z direction
//                 //   ..rotateY(_rotateAnim.value),
//                 child: Container(
//                     width: _cardWith,
//                     height: _cardHeight,
//                     color: Colors.greenAccent));
//           },
//         ),
//         onTap: () {},
//       ),
//       GestureDetector(
//         onTapUp: (details) {
//           rotate();
//         },
//         child: AnimatedBuilder(
//           animation: _rotateAnim,
//           builder: (context, child) {
//             // double x = _translateXAnimGo.isCompleted
//             //     ? _translateXAnimBack.value
//             //     : _translateXAnimGo.value;
//             double x = _translateXAnim.value;
//             double res = (-4 * (pow(x, 2)) + (x * 4));

//             if (_rotateAnim.value > pi / 2) {
//               testColor = Colors.brown;
//             } else {
//               testColor = Colors.yellow;

//               print("* ${mywid.length}");
//               if (mywid.length >= 2) {
//                 mywid.removeAt(1);
//               }
//               print("*% ${mywid.length}");
//             }
//             ;
//             return Transform(
//                 alignment: Alignment.center,
//                 // origin: const Offset(-20, 0),
//                 transform: Matrix4(
//                   _scaleAnim2.value,
//                   0,
//                   0,
//                   0,
//                   0,
//                   _scaleAnim2.value,
//                   0,
//                   0,
//                   0,
//                   0,
//                   1,
//                   0.01,
//                   -(res * 30),
//                   0,
//                   0,
//                   1,
//                 )..rotateY(-_rotateAnim.value),

//                 // transform: Matrix4.identity()
//                 //   ..setEntry(3, 2,
//                 //       0.003) // col = 2, row = 3 & 0.003 = depth perception in the Z direction
//                 //   ..rotateY(_rotateAnim.value),
//                 child: Container(
//                     width: _cardWith, height: _cardHeight, color: testColor));
//           },
//         ),
//         onTap: () {},
//       ),
//     ];

//     super.initState();
//   }

//   final double _cardWith = 100;
//   final double _cardHeight = 100;

//   Color testColor = Colors.yellow;

//   @override
//   void dispose() {
//     _rotateAnimCntrl.dispose();
//     // _returnToPositionCntrl.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("--- ${mywid.length}");
//     _rotateAnimCntrl.value == pi ? print("object") : null;
//     print("object");
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         FloatingActionButton(onPressed: () {
//           _rotateAnimCntrl.reverse();
//         }),
//         Expanded(
//           child: Center(
//             child: Stack(
//               children: _cardsGEnerator(),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   List<Widget> _cardsGEnerator() {
//     List<Widget> temp = [];

//     for (var i = 0; i < mywid.length; i++) {}

//     return mywid
//         .map((e) => GestureDetector(
//               onTap: () {
//                 setState(() {
//                   mywid.removeLast();
//                 });
//               },
//               child: Center(
//                   child: FlutterLogo(size: (Random().nextInt(200).toDouble()))),
//             ))
//         .toList();
//   }

//   rotate() async {
//     await _rotateAnimCntrl.forward();
//     // await _rotateAnimCntrl.reverse();
//   }
// }

class MyCarousel2 extends StatefulWidget {
  const MyCarousel2({super.key});

  @override
  State<MyCarousel2> createState() => _MyCarousel2State();
}

List<Widget> _items = [const FlutterLogo(), const FlutterLogo()];

class _MyCarousel2State extends State<MyCarousel2>
    with TickerProviderStateMixin {
  late AnimationController _rotateAnimCntrl;

  late Animation<double> _rotateAnim1;
  late Animation<double> _rotateAnim2;

  late Animation<double> _translateXAnim;
  late Animation<double> _translateXAnim2;

  @override
  void initState() {
    _rotateAnimCntrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _rotateAnim1 = Tween<double>(begin: 0.0, end: pi / 2).animate(
        CurvedAnimation(
            parent: _rotateAnimCntrl, curve: const Interval(0.0, .5)));
    _rotateAnim2 = Tween<double>(begin: pi / 2, end: 0.0).animate(
        CurvedAnimation(
            parent: _rotateAnimCntrl, curve: const Interval(0.5, 1.0)));

    _translateXAnim = Tween<double>(begin: 0.0, end: 30.0).animate(
        CurvedAnimation(
            parent: _rotateAnimCntrl, curve: const Interval(0.0, .5)));
    _translateXAnim2 = Tween<double>(begin: 30.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _rotateAnimCntrl, curve: const Interval(0.5, 1.0)));

    super.initState();
  }

  List<Widget> rawItems = [
    Container(
      width: 100,
      height: 100,
      color: Colors.pinkAccent,
      child: const Text("1"),
    ),
    Container(
        width: 100,
        height: 100,
        color: Colors.lightGreenAccent,
        child: const Text("2")),
  ];

  @override
  Widget build(BuildContext context) {
    List x = _carsGenerator();
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: FloatingActionButton(onPressed: () async {
            await _rotateAnimCntrl.forward();
            _rotateAnimCntrl.reset();
            setState(() {
              rawItems = rawItems.reversed.toList();
            });
          }),
        ),
        Center(child: Stack(children: [...x])),
      ],
    );
  }

  List<Widget> _carsGenerator() {
    print("object");
    // bool firstOnTop = true;
    // bool hasReachedToActivationLimit = false;
    List<Widget> res = [
      AnimatedBuilder(
        animation: _rotateAnimCntrl,
        builder: ((context, child) {
          print(_rotateAnim2.value);
          return Stack(
            children: [
              Visibility(
                visible: !(_rotateAnim1.value == pi / 2),
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
                      0.003,
                      _translateXAnim.value,
                      0,
                      0,
                      1,
                    )..rotateY(_rotateAnim1.value),
                    child: rawItems[0]),
              ),
              Visibility(
                visible: !(_rotateAnim1.value == pi / 2),
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
                      0.003,
                      -_translateXAnim.value,
                      0,
                      0,
                      1,
                    )..rotateY(_rotateAnim1.value),
                    child: rawItems[1]),
              ),
              Visibility(
                visible: !(_rotateAnim2.value == (pi / 2)),
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
                      0.003,
                      -_translateXAnim2.value,
                      0,
                      0,
                      1,
                    )..rotateY(-_rotateAnim2.value),
                    child: rawItems[1]),
              ),
              Visibility(
                visible: !(_rotateAnim2.value == (pi / 2)),
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
                      0.003,
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
