import 'package:flutter/material.dart';
import 'package:project3/models/item_class.dart';
import '../widgets/page2-widgets-and-sections.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.selectedItem});
  final MyCarouselItem selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            expandedHeight: 700,
            collapsedHeight: 50,
            toolbarHeight: 50,
            // centerTitle: true,
            elevation: 0,
            pinned: true,
            floating: false,
            backgroundColor: selectedItem.themeColor,
            leading: Container(
              padding: const EdgeInsets.only(right: 0, top: 0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            actions: [
              Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: const Icon(Icons.ios_share))
            ],
            flexibleSpace: Carousel2Section(selectedItem: selectedItem)),
        CharacterInfoSection(selectedItem: selectedItem)
      ],
    ));
  }
}
