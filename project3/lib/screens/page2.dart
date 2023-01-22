import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project3/item_class.dart';

import '../widgets/carousel2.dart';
import '../widgets/shapes.dart';

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
          // bottom: PreferredSize(
          //   preferredSize: const Size.fromHeight(50.0), // Add this code
          //   child: Container(
          //     color: Colors.pink,
          //   ),
          // ),
          backgroundColor: Colors.red.withOpacity(1),
          leading: Container(
            // color: Colors.green,
            padding: const EdgeInsets.only(right: 0, top: 0),
            child: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            Container(
                padding: const EdgeInsets.only(right: 10),
                // color: Colors.green,
                // padding: EdgeInsets.only(right: 10, top: 0),
                child: const Icon(Icons.ios_share))
          ],
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(top: 35),
            collapseMode: CollapseMode.parallax,
            expandedTitleScale: 1,
            centerTitle: true,
            // title: Container(color: Colors.red),

            title: Container(
                width: double.infinity,
                // height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(1),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                // margin: const EdgeInsets.only(
                //     top: 35, bottom: 35), //for statusbar without safe area
                child: AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: SizedBox(
                      // width: 300,
                      child: Image.asset("assets/images/spiderLogo.png",
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
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.red,
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Marvel - Avengers",
                    style: TextStyle(
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1
                        ..color = Colors.white,
                      fontSize: 25,
                      // color: Colors.white,
                    ),
                  ),
                ),
                Container(
                    padding:
                        const EdgeInsets.only(top: 15, bottom: 15, left: 25),
                    // height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: CustomPaint(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // padding: EdgeInsets.all(5),
                            // color: Colors.green,
                            // height: 25,
                            child: Row(
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
                                const Text(
                                  "4.8",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.red, Colors.red.withOpacity(.2)])),
                  // height: double.infinity,
                  // color: Colors.red.withOpacity(.2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 25, bottom: 5),
                        child: const Text(
                          "Peter parker - Earth 616",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              letterSpacing: 1.4),
                        ),
                      ),
                      Text(
                        'Stan Lee, Larry, Don kerky',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: 10,
                          letterSpacing: 1.4,
                        ),
                      ),
                      SizedBox(height: 15),
                      const Text(
                        'Tony escaped death by reconfiguring his body with a digital back-up of his mind,[54] inadvertently causing him to become temporarily convinced that he was a clone of the real, late Tony Stark.[55] This resulted in Tony leading an army of artificial-life forms in a war against the anti-A.I. campaign of his adoptive brother Arno.[1] After coming around to the fact that he was the real Tony Stark all along, Tony stopped Arno\'s deranged plan to enslave humanity to stop a non-existent alien threat,[56] and he then opted to embark on a journey of self-discovery to escape the baggage of his career. Stepping away from his high-tech lifestyle, Tony finds himself returning to his roots in an attempt to put back the "man" in Iron Man.[57]',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "arial",
                            fontSize: 12,
                            letterSpacing: 1.4),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.justify,
                      ),
                      Container(
                        // height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 25, bottom: 5),
                              child: const Text(
                                "Related Characters",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    letterSpacing: 1.4),
                              ),
                            ),
                            Container(
                              height: 125,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: widget.selectedItem.moreImages!
                                    .map((e) => Container(
                                          margin: EdgeInsets.only(right: 25),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                          e,
                                                        )),
                                                    shape: BoxShape.circle),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                width: 100,
                                                // color: Colors.green,
                                                child: Center(
                                                  child: Text(
                                                    e,
                                                    style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(.8),
                                                        fontSize: 10,
                                                        letterSpacing: 1.4,
                                                        overflow: TextOverflow
                                                            .ellipsis),
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
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 25, bottom: 5),
                        child: const Text(
                          "Birth and Adoption",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              letterSpacing: 1.4),
                        ),
                      ),
                      const Text(
                        'Anthony Edward Stark, also known as Tony Stark, was born to two S.H.I.E.L.D  agents, Amanda Armstrong and Jude. Jude was a secret Hydra double-agent with little regard for anybody but himself and regularly sold out fellow S.H.I.E.L.D. operatives. He was almost responsible for Amanda\'s own death at the hands of an assassin. However, he fell in love with Amanda before sending her to her death and decided to save her.[58] After this incident they got to know each other and began a relationship.[59] Two years later, Amanda became pregnant. A week before giving birth to the baby, Jude decided to reveal his true allegiance to Amanda and its implications in Jude\'s timely intervention that saved her life. The subsequent discussion escalated, and Amanda killed Jude. Traumatized by this development, Amanda asked S.H.I.E.L.D. to ensure her future baby would find a safe and happy home. However, director Nick Fury followed the same procedure used for unwanted pregnancies in the agency, and the baby was left in an orphanage in Sofia, Bulgaria after Amanda birthed him in a local hospital. Fury\'s associate and famous industrialist Howard Stark learned of this and decided to find the baby and adopt him, keeping the name Amanda wished he retained: Anthony.[58] In addition to Howard and his wife Maria suffering the latter\'s inability to give birth again,[59] they needed to find a healthy boy to act as a decoy in place of their secret firstborn, Arno Stark. Arno\'s gestation had been extremely difficult, and his birth was only made possible with the help of an alien robot, the Rigellian Recorder 451, who had agreed to help the baby survive in exchange for the opportunity to bioengineer him, so he could accelerate humanity\'s technological growth in the future.[60]',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "arial",
                            fontSize: 12,
                            letterSpacing: 1.4),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        // ...['1', '2', '3']
        //     .map((e) => const SliverToBoxAdapter(
        //             child: SizedBox(
        //           height: 500,
        //           child: FlutterLogo(
        //             size: 200,
        //           ),
        //         )))
        //     .toList()
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
