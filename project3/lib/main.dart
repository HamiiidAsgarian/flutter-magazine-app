import 'dart:math';

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

class _HomeScreenState extends State<HomeScreen> {
  static const double _cardWith = 350;
  static const double _cardHeight = 500;
  final List<Widget> _items = [
    FlutterLogo(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyCustomCards(
            items: _items,
            currentIndex: (currentIndex) {
              print(currentIndex);
            },
            leftOrRightResult: (MyCardsDragDirection dragDirection) {
              print(dragDirection);
            }),
      ),
    );
  }
}
