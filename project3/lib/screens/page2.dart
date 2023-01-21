import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/item_class.dart';

import '../widgets/carousel2.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key, required this.selectedItem});
  final MyCarouselItem selectedItem;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late Widget _dynamicBackgroundImage;

  int carouselIndex = 0;

  @override
  void initState() {
    _dynamicBackgroundImage =
        // FlutterLogo(
        //   size: 200,
        // );
        SizedBox.expand(
      child: Image.asset(widget.selectedItem.moreImages![carouselIndex],
          fit: BoxFit.cover, key: Key(carouselIndex.toString())),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.selectedItem.titel);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 60,
          bottom: PreferredSize(
            // Add this code
            preferredSize: Size.fromHeight(25.0), // Add this code
            child: Container(
              color: Colors.pink,
            ), // Add this code
          ),
          elevation: 0,
          // centerTitle: true,
          pinned: true,
          floating: false,
          backgroundColor: Colors.amberAccent.withOpacity(.5),
          leading: Padding(
            padding: EdgeInsets.only(right: 10, top: 25),
            child: const Icon(Icons.arrow_back_ios),
          ),

          actions: const [
            Padding(
                padding: EdgeInsets.only(right: 10, top: 25),
                child: Icon(Icons.ios_share))
          ],
          flexibleSpace: FlexibleSpaceBar(
            expandedTitleScale: 1,
            // titlePadding: EdgeInsetsDirectional.only(
            //   start: 0.0,
            //   bottom: 0.0,
            // ),
            // titlePadding: EdgeInsets.only(top: 1),
            centerTitle: true,
            title: Stack(clipBehavior: Clip.none, children: [
              Align(
                alignment: const Alignment(0, 1),
                child: ClipRect(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      margin: const EdgeInsets.only(top: 50),
                      // color: Colors.green,
                      // width: 200,
                      // height: 50,
                      // color: Colors.brown,
                      child: AnimatedSwitcher(
                          duration: const Duration(seconds: 1),
                          child: Container(
                            // padding: const EdgeInsets.only(top: 0, bottom: 0),
                            width: 500,
                            // height: double.infinity,
                            // color: Colors.amber,
                            child: Image.asset("assets/images/spiderLogo.png"),
                          ))),
                ),
              )
            ]),
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
                          margin: const EdgeInsets.only(bottom: 50, top: 25),
                          width: 20,
                          child: MyCarousel2(
                            items: widget.selectedItem.moreImages ?? [],
                            onChange: (pageIndex) {
                              print("**** $pageIndex");

                              setState(() {
                                carouselIndex = pageIndex;
                                _dynamicBackgroundImage = SizedBox.expand(
                                    key: Key(carouselIndex.toString()),
                                    child: Image.asset(
                                      widget.selectedItem
                                          .moreImages![carouselIndex],
                                      fit: BoxFit.fill,
                                    ));
                              });
                            },
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // title: Text("data"),
          expandedHeight: 600,
        ),
        ...['1', '2', '3']
            .map((e) => const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 500,
                  child: FlutterLogo(
                    size: 200,
                  ),
                )))
            .toList()
        // SliverToBoxAdapter(child: Container(child:  MyCarousel2())),
        // SliverToBoxAdapter(child: Container(child:  MyCarousel2())),
        // SliverToBoxAdapter(child: Container(child:  MyCarousel2())),
        // SliverToBoxAdapter(child: Container(child:  MyCarousel2()))
      ],
    )

        // body: Column(
        //   children: [
        //     const SliverAppBar(
        //       expandedHeight: 500,
        //       flexibleSpace: FlexibleSpaceBar(
        //         title: Text("data"),
        //       ),
        //     ),
        //     MyCarousel2(),
        //   ],
        // ),
        );
  }
}
