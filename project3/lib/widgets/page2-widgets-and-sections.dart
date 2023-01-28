import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/widgets/shapes.dart';

import '../models/item_class.dart';
import 'carousel2.dart';

class MyCarouselPointer extends StatelessWidget {
  const MyCarouselPointer(
      {super.key, this.carouselIndex = 0, this.carouselLength = 0});

  final int carouselIndex;
  final int carouselLength;

  @override
  Widget build(BuildContext context) {
    List<Widget> pointerMaker() {
      List<Widget> temp = [];
      for (int i = 0; i < carouselLength; i++) {
        if (carouselIndex == i) {
          temp.add(TweenAnimationBuilder(
              key: UniqueKey(),
              duration: const Duration(milliseconds: 400),
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  width: 20 + (value * 50),
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                );
              }));
        } else {
          temp.add(TweenAnimationBuilder(
              key: Key("$i"),
              duration: const Duration(milliseconds: 400),
              tween: Tween(begin: 1.0, end: 0.0),
              builder: (context, value, child) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white.withOpacity((value + .7) / 2),
                  ),
                  width: (value * 50) + 20,
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                );
              }));
        }
      }
      return temp;
    }

    return SizedBox(
      // ignore: sort_child_properties_last
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pointerMaker()),
      // width: 200,
      height: 50,
      // color: Colors.green,
    );
  }
}

class Carousel2Section extends StatefulWidget {
  const Carousel2Section({super.key, required this.selectedItem});
  final MyCarouselItem selectedItem;

  @override
  State<Carousel2Section> createState() => _Carousel2SectionState();
}

class _Carousel2SectionState extends State<Carousel2Section> {
  late Widget _dynamicBackgroundImage;

  int carouselIndex = 0;

  @override
  void initState() {
    _dynamicBackgroundImage = SizedBox.expand(
      child: Image.asset(widget.selectedItem.moreImages![carouselIndex],
          fit: BoxFit.cover, key: Key(carouselIndex.toString())),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      titlePadding: const EdgeInsets.only(top: 35),
      collapseMode: CollapseMode.parallax,
      expandedTitleScale: 1,
      centerTitle: true,
      // title: Container(color: Colors.red),

      title: Container(
          width: double.infinity,
          // height: double.infinity,
          decoration: BoxDecoration(
              color: widget.selectedItem.themeColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          // margin: const EdgeInsets.only(
          //     top: 35, bottom: 35), //for statusbar without safe area
          child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: SizedBox(
                // width: 300,
                child: Image.asset(widget.selectedItem.logoUrl ?? "",
                    fit: BoxFit.fill),
              ))),
      background: Stack(
        children: [
          ClipRect(
            child: SizedBox.expand(
                child: AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: _dynamicBackgroundImage)),
          ),
          SizedBox.expand(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 010, sigmaY: 010),
                child: Container(
                    margin: const EdgeInsets.only(bottom: 70),
                    // width: 20,
                    child: MyCarousel2(
                      items: widget.selectedItem.moreImages ?? [],
                      onChange: (pageIndex) {
                        setState(() {
                          carouselIndex = pageIndex;
                          _dynamicBackgroundImage = SizedBox.expand(
                              key: Key(carouselIndex.toString()),
                              child: Image.asset(
                                widget.selectedItem.moreImages![carouselIndex],
                                fit: BoxFit.fill,
                              ));
                        });
                      },
                    )),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, .65),
            child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  // width: 500,
                  height: 20,
                  // color: widget.selectedItem.themeColor!.withOpacity(.5),
                  child: MyCarouselPointer(
                    carouselIndex: carouselIndex,
                    carouselLength: widget.selectedItem.moreImages!.length,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class CharacterInfoSection extends StatelessWidget {
  const CharacterInfoSection({super.key, required this.selectedItem});
  final MyCarouselItem selectedItem;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: selectedItem.themeColor,
        child: Column(
          children: [
            Text(
              selectedItem.category ?? "",
              style: TextStyle(
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1
                  ..color = Colors.white,
                fontSize: 25,
                // color: Colors.white,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25),
                // height: 50,
                decoration: BoxDecoration(
                  color: selectedItem.themeColor,
                ),
                child: CustomPaint(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...List.generate(
                              1,
                              ((index) => const Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Icon(
                                      Icons.star_rounded,
                                      color: Colors.amber,
                                      size: 30,
                                    ),
                                  ))),
                          Text(
                            (selectedItem.rate ?? "NA").toString(),
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        // color: Colors.white,
                        width: 250,
                        child: CustomPaint(
                          painter: FavoriteOptions(color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 25, left: 50, bottom: 5, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Icon(
                                  Icons.share_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Icon(
                                  Icons.bookmark_border_outlined,
                                  color: Colors.white,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              color: selectedItem.themeColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 25, bottom: 5),
                    child: Text(
                      selectedItem.name ?? "",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          letterSpacing: 1.4),
                    ),
                  ),
                  Text(
                    selectedItem.author ?? "",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontSize: 10,
                      letterSpacing: 1.4,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    selectedItem.paragraph1 ?? "",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "arial",
                        fontSize: 12,
                        letterSpacing: 1.4),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.justify,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 25, bottom: 5),
                        child: const Text(
                          "Related Characters",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              letterSpacing: 1.4),
                        ),
                      ),
                      SizedBox(
                        height: 125,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: selectedItem.relatedCharacters!
                              .map((e) => Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 3,
                                                  color: Colors.white),
                                              color: selectedItem.themeColor,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                    e.imageUrl,
                                                  )),
                                              shape: BoxShape.circle),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          width: 100,
                                          // color: Colors.green,
                                          child: Center(
                                            child: Text(
                                              e.name,
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(.8),
                                                  fontSize: 10,
                                                  letterSpacing: 1.4,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 25, bottom: 5),
                    child: Text(
                      selectedItem.title2 ?? "",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          letterSpacing: 1.4),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Text(
                      selectedItem.paragraph2 ?? "",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "arial",
                          fontSize: 12,
                          letterSpacing: 1.4),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
