// // import 'dart:math';

// // import 'package:flutter/material.dart';

// // main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(home: HomeScreen());
// //   }
// // }

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
// //   late AnimationController _cntrl1;
// //   late Animation<double> _traslateAnim;
// //   late Animation _rotateAnim;

// //   List anims = [];
// //   @override
// //   void initState() {
// //     _cntrl1 = AnimationController(vsync: this, duration: Duration(seconds: 1));
// //     _traslateAnim = Tween<double>(begin: 0, end: 100)
// //         .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.easeInBack));
// //     _rotateAnim = Tween<double>(begin: 0, end: pi / 2)
// //         .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));

// //     anims = [
// //       _traslateAnim = Tween<double>(begin: 1, end: 2)
// //           .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear)),
// //       _traslateAnim = Tween<double>(begin: 1.5, end: 1)
// //           .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear)),
// //       _traslateAnim = Tween<double>(begin: 1, end: 0)
// //           .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear))
// //     ];

// //     super.initState();
// //   }

// //   double updateDx = 0;
// //   double updateDy = 0;

// //   double startDx = 0.0;
// //   double startDy = 0.0;

// //   // List items = [Colors.red, Colors.green, Colors.blue];

// //   List itemss = [
// //     Container(
// //       color: Colors.red,
// //       width: 100,
// //       height: 100,
// //     ),
// //     Container(
// //       color: Colors.green,
// //       width: 100,
// //       height: 100,
// //     ),
// //     Container(
// //       color: Colors.blue,
// //       width: 100,
// //       height: 100,
// //     )
// //   ];

// //   List<Widget> my() {
// //     List<Widget> _res = [];

// //     for (int i = 0; i < itemss.length; i++) {
// //       print("x");
// //       _res.add(GestureDetector(
// //         onTap: () async {
// //           // if (index == 2) {
// //           print("object");
// //           await _cntrl1.forward();
// //           setState(() {
// //             var temp = itemss.last;
// //             itemss.removeLast();
// //             itemss.insert(0, temp);
// //           });
// //           _cntrl1.reset();
// //           // }
// //         },
// //         child: AnimatedBuilder(
// //             animation: anims[i],
// //             builder: ((context, child) => Transform.scale(
// //                 scale: anims[i].value, child: Center(child: itemss[i])))),
// //       ));
// //     }
// //     return _res;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // List a = items
// //     //     .asMap()
// //     //     .map((key, value) => MapEntry(key, my(key)))
// //     //     .values
// //     //     .toList();
// //     return Scaffold(
// //       body: Center(
// //         child: Stack(
// //           children: [
// //             ...my()
// //             // AnimatedBuilder(
// //             //     animation: anims[2],
// //             //     builder: ((context, child) => Transform.scale(
// //             //         scale: anims[2].value,
// //             //         child: Center(
// //             //             child: Container(
// //             //                 color: items[2], width: 400, height: 400))))),
// //             // AnimatedBuilder(
// //             //     animation: anims[1],
// //             //     builder: ((context, child) => Transform.scale(
// //             //         scale: anims[1].value,
// //             //         child: Center(
// //             //             child: Container(
// //             //                 color: items[1], width: 200, height: 200))))),

// //             // // Center(child: Container(color: items[1], width: 300, height: 300)),
// //             // GestureDetector(
// //             //     key: Key("0".toString()),
// //             //     onTap: () {
// //             //       _cntrl1.reset();
// //             //       _cntrl1.forward();
// //             //       setState(() {
// //             //         var temp = items.first;
// //             //         items.removeAt(0);
// //             //         items.add(temp);
// //             //       });
// //             //     },
// //             //     child: Center(
// //             //         child:
// //             //             Container(color: items[0], width: 100, height: 100))),
// //             // // AnimatedBuilder(
// //             // //   animation: CurvedAnimation(
// //             // //       curve: Interval(.0, 0.3, curve: Curves.linear),
// //             // //       parent: _cntrl1),
// //             // //   builder: (context, child) => Transform.scale(
// //             // //     scale: _rotateAnim.value,
// //             // //     child: Transform.rotate(
// //             // //         angle: _rotateAnim.status == AnimationStatus.forward
// //             // //             ? _rotateAnim.value
// //             // //             : 20,
// //             // //         child: Container(
// //             // //             width: 600, height: 600, color: Colors.blueAccent)),
// //             // //   ),
// //             // // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   item3() => AnimatedBuilder(
// //         animation: _traslateAnim,
// //         builder: (context, child) {
// //           return Transform.rotate(
// //             angle: _traslateAnim.status == AnimationStatus.forward
// //                 ? _rotateAnim.value
// //                 : 0,
// //             child: Transform.translate(
// //               offset: Offset(
// //                   _traslateAnim.status == AnimationStatus.forward
// //                       ? _traslateAnim.value
// //                       : updateDx,
// //                   updateDy),
// //               child: GestureDetector(
// //                 onPanEnd: (details) {
// //                   onPanEnd();
// //                 },
// //                 onPanDown: (details) {
// //                   onPanDown(details);
// //                 },
// //                 onPanUpdate: (details) {
// //                   onPanUpdate(details);
// //                 },
// //                 child: Container(
// //                   width: 500,
// //                   height: 500,
// //                   color: Colors.red,
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       );

// //   onPanDown(DragDownDetails details) {
// //     setState(() {
// //       startDx = details.localPosition.dx - 250;
// //       startDy = details.localPosition.dy - 250;
// //     });
// //   }

// //   onPanUpdate(DragUpdateDetails details) {
// //     setState(() {
// //       updateDx = (details.localPosition.dx - 250) - startDx;
// //       updateDy = (details.localPosition.dy - 250) - startDy;
// //     });
// //   }

// //   onPanEnd() async {
// //     // _cntrl1.reset;
// //     if (updateDx > 50) {
// //       _traslateAnim = Tween<double>(begin: updateDx, end: 1000)
// //           .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.easeOut));
// //       _rotateAnim = Tween(begin: 0, end: pi / 4)
// //           .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));

// //       print(">");
// //     } else if (updateDx < -50) {
// //       _traslateAnim = Tween<double>(begin: updateDx, end: -1000)
// //           .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.easeOut));
// //       _rotateAnim = Tween(begin: 0, end: -pi / 4)
// //           .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));

// //       print("<");
// //     }

// //     await _cntrl1.forward();
// //     setState(() {
// //       updateDy = 0;
// //       _cntrl1.reset();
// //     });
// //   }
// // }

// //-----------------------------------------------------------

// import 'dart:math';

// import 'package:flutter/material.dart';

// main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: HomeScreen());
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
//   late AnimationController _cntrl1;

//   late Animation<double> _traslateAnim;
//   late Animation<double> _traslateAnim1;
//   late Animation<double> _traslateAnim2;
//   late Animation<double> _traslateAnim3;

//   late Animation<double> _rotateAnim;
//   late Animation<double> _rotateAnim1;
//   late Animation<double> _rotateAnim2;
//   late Animation<double> _rotateAnim3;

//   List<Animation<double>> translateAnims = [];
//   List<Animation<double>> rotateAnims = [];

//   @override
//   void initState() {
//     _cntrl1 =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));

//     _traslateAnim = Tween<double>(begin: 1, end: 0)
//         .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));
//     _traslateAnim1 = Tween<double>(begin: .9, end: 1)
//         .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));
//     _traslateAnim2 = Tween<double>(begin: .7, end: .9)
//         .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));
//     _traslateAnim3 = Tween<double>(begin: 0, end: .7)
//         .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));

//     // _traslateAnimN = Tween<double>(begin: 1, end: 2)
//     //     .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));

//     _rotateAnim = Tween<double>(begin: 0, end: 0)
//         .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));
//     _rotateAnim1 = Tween<double>(begin: -(pi / 7), end: 0)
//         .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));
//     _rotateAnim2 = Tween<double>(begin: (pi / 7), end: -(pi / 7))
//         .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));
//     _rotateAnim3 = Tween<double>(begin: 0, end: (pi / 7))
//         .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));

//     translateAnims = [
//       _traslateAnim,
//       _traslateAnim1,
//       _traslateAnim2,
//       _traslateAnim3,
//     ];
//     rotateAnims = [_rotateAnim, _rotateAnim1, _rotateAnim2, _rotateAnim3];

//     super.initState();
//   }

//   double updateDx = 0;
//   double updateDy = 0;

//   double startDx = 0.0;
//   double startDy = 0.0;

//   // List items = [Colors.red, Colors.green, Colors.blue];

//   List itemss = [
//     Container(
//       color: Colors.red,
//       width: 250,
//       height: 500,
//       child: const Text("1"),
//     ),
//     Container(
//       color: Colors.green,
//       width: 250,
//       height: 500,
//       child: const Text("2"),
//     ),
//     Container(
//       color: Colors.blue,
//       width: 250,
//       height: 500,
//       child: const Text("3"),
//     ),
//     // Container(
//     //   color: Color.fromARGB(255, 202, 13, 0),
//     //   width: 250,
//     //   height: 500,
//     //   child: Text("1"),
//     // ),
//   ];

//   List<Widget> my() {
//     List<Widget> res = [];

//     for (int i = itemss.length - 1; i >= 0; i--) {
//       if (i == itemss.length - 1) {
//         res.add(AnimatedBuilder(
//           animation: _cntrl1,
//           builder: (context, child) => Transform.scale(
//               scale: translateAnims[i].value,
//               child: Transform.rotate(
//                 origin: const Offset(0, 200),
//                 angle: rotateAnims[i].value,
//                 child: itemss[i],
//               )),
//         ));
//       }

//       res.add(GestureDetector(
//         onTap: (() async {
//           await _cntrl1.forward();

//           setState(() {
//             // updateDy = 0;

//             var temp = itemss.first;
//             itemss.removeAt(0);
//             itemss.add(temp);

//             _cntrl1.reset();
//           });
//         }),
//         child: AnimatedBuilder(
//           animation: _cntrl1,
//           builder: (context, child) => Transform.scale(
//               scale: translateAnims[i].value,
//               child: Transform.rotate(
//                 origin: const Offset(0, 200),
//                 angle: rotateAnims[i].value,
//                 child: itemss[i],
//               )),
//         ),
//       ));
//     }
//     res.insert(
//         0,
//         AnimatedBuilder(
//           animation: _cntrl1,
//           builder: (context, child) => Transform.scale(
//               scale: translateAnims[3].value,
//               child: Transform.rotate(
//                 origin: const Offset(0, 200),
//                 angle: rotateAnims[3].value,
//                 child: itemss[0],
//               )),
//         ));
//     print(res.length);
//     return res;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           children: [
//             ...my(),
//           ],
//         ),
//       ),
//     );
//   }

//   item3() => AnimatedBuilder(
//         animation: _traslateAnim,
//         builder: (context, child) {
//           return Transform.rotate(
//             angle: _traslateAnim.status == AnimationStatus.forward
//                 ? _rotateAnim.value
//                 : 0,
//             child: Transform.translate(
//               offset: Offset(
//                   _traslateAnim.status == AnimationStatus.forward
//                       ? _traslateAnim.value
//                       : updateDx,
//                   updateDy),
//               child: GestureDetector(
//                 onPanEnd: (details) {
//                   onPanEnd();
//                 },
//                 onPanDown: (details) {
//                   onPanDown(details);
//                 },
//                 onPanUpdate: (details) {
//                   onPanUpdate(details);
//                 },
//                 child: Container(
//                   width: 500,
//                   height: 500,
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//           );
//         },
//       );

//   onPanDown(DragDownDetails details) {
//     setState(() {
//       startDx = details.localPosition.dx - 250;
//       startDy = details.localPosition.dy - 250;
//     });
//   }

//   onPanUpdate(DragUpdateDetails details) {
//     setState(() {
//       updateDx = (details.localPosition.dx - 250) - startDx;
//       updateDy = (details.localPosition.dy - 250) - startDy;
//     });
//   }

//   onPanEnd() async {
//     // _cntrl1.reset;
//     if (updateDx > 50) {
//       // _traslateAnim = Tween<double>(begin: updateDx, end: 1000)
//       //     .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.easeOut));
//       // _rotateAnim = Tween(begin: 0, end: pi / 4)
//       //     .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));

//       _traslateAnim = translateAnims[2];
//       _rotateAnim = rotateAnims[2];

//       print(">");
//     } else if (updateDx < -50) {
//       _traslateAnim = translateAnims[2];
//       _rotateAnim = rotateAnims[2];

//       // _traslateAnim = Tween<double>(begin: updateDx, end: -1000)
//       //     .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.easeOut));
//       // _rotateAnim = Tween(begin: 0, end: -pi / 4)
//       //     .animate(CurvedAnimation(parent: _cntrl1, curve: Curves.linear));

//       print("<");
//     }

//     await _cntrl1.forward();
//     setState(() {
//       // updateDy = 0;

//       var temp = itemss.last;
//       itemss.removeLast();
//       itemss.insert(0, temp);

//       // _cntrl1.reset();
//     });
//   }
// }
