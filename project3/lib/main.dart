import 'dart:developer';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/carousel1.dart';
import 'package:project3/page2.dart';
import 'package:project3/widgets.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      //     home: Page2(
      //   selectedItem:
      //       Container(width: 200, height: 400, color: Colors.pinkAccent),
      // )
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        leading: const CircleAvatar(radius: 50),
        title: Column(
          children: const [Text("Hello"), Text("Hamid")],
        ),
      ),
      body: Column(
        children: const [Carousel1()],
      ),
    );
  }
}
