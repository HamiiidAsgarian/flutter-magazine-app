import 'package:flutter/material.dart';
import 'package:project3/widgets/carousel1.dart';
import 'package:project3/item_class.dart';
import 'package:project3/screens/other_characters.dart';
import 'package:project3/widgets/shapes.dart';

import '../widgets/page1-widgets_and_sections.dart';
import 'appbar_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {required this.carouselItems, super.key, required this.otherHeroesItems});

  final List<MyCarouselItem> carouselItems;
  final List<MyCarouselItem> otherHeroesItems;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CustomPaint> otherHeroesItems = [];
  List<String> geanras = [
    'Marvel Comics',
    "DC Comics",
    "Anime",
    "Manga",
    "Cartoon",
    "POK",
    "Posor"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 253, 234, 8),
        bottomNavigationBar: const MyNavbar(),
        appBar: const MyAppbar(),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(255, 253, 234, 8),
                Color.fromARGB(255, 218, 218, 218)
              ])),
          child: Column(
            children: [
              GeanraSection(geanras: geanras),
              CarouselSection(cardItems: widget.carouselItems),
              OtherCharactersSection(items: widget.otherHeroesItems)
            ],
          ),
        ),
      ),
    );
  }
}

///Cards are in 4 shapes, first shape is unique, and the rest are created based on dividablility with 3,5 and 2. 

