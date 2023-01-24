import 'package:flutter/material.dart';

import '../item_class.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key, this.selectedItem});

  final MyCarouselItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Hero(
            tag: "hero1",
            child: Container(
              color: Colors.amber,
              width: 100,
              height: 100,
            )),
        Center(
          child: FloatingActionButton(
            child: Text(selectedItem!.titel.toString()),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    ));
  }
}
