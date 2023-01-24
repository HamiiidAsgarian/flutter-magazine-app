import 'package:flutter/material.dart';
import 'package:project3/widgets/shapes.dart';

class MyNavbar extends StatelessWidget {
  const MyNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 12.5, right: 12.5, top: 2.5, bottom: 5),
      color: const Color.fromARGB(255, 218, 218, 218),
      height: 60,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: NavbarShape(color: Colors.black),
              child: ClipPath(
                clipper: NavbarClip(),
                child: Stack(
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 255, 243, 110),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 1),
                        height: 30,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/images/dotpattern.png",
                          color: const Color.fromARGB(255, 255, 0, 0)
                              .withAlpha(100),
                          repeat: ImageRepeat.repeat,
                        ),
                      ),
                    ),
                  ],
                ),

                // ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(.7, 0),
            child: Column(
              children: const [
                // Text(
                //   "Home",
                //   style: TextStyle(
                //       color: Color.fromARGB(255, 255, 255, 255),
                //       shadows: [
                //         Shadow(
                //             color: Color.fromARGB(255, 0, 0, 0),
                //             offset: Offset(-2, 2))
                //       ]),
                // ),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(-.7, 0),
            child: Image.asset(
              "assets/images/search.png",
              width: 35,
            ),
          ),
          Align(
            alignment: const Alignment(.7, 0),
            child: Image.asset(
              "assets/images/heart.png",
              width: 35,
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                // color: Colors.red,
                width: 100,
                height: 100,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: Transform.translate(
                        offset: const Offset(0, -20),
                        child: Transform.scale(
                            scale: 1.3,
                            child: Image.asset(
                              "assets/images/selctednav.png",
                            )),
                      ),
                    ),
                    Positioned(
                        top: -17.5,
                        left: 27.5,
                        // alignment: Alignment.topCenter,
                        // right: 20,
                        // top: -15,
                        child: SizedBox(
                            width: 35,
                            height: 35,
                            child: Image.asset(
                              "assets/images/home.png",
                              color: const Color.fromARGB(255, 51, 51, 51),
                            )))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class MyAppbar extends StatelessWidget with PreferredSizeWidget {
  const MyAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(width: 3)),
      // color: Color.fromARGB(255, 255, 251, 0).withOpacity(0),
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Row(children: [
            Stack(
              children: [
                Image.asset("assets/images/i3.png", fit: BoxFit.fill),
                Image.asset("assets/images/avatar.png"),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromARGB(255, 51, 51, 51),
                          fontFamily: "avengers"),
                      children: <TextSpan>[
                        TextSpan(text: 'Hi'),
                        TextSpan(
                            text: '  Hamiiid  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "avengers",
                                fontSize: 15,
                                color: Colors.black)),
                        TextSpan(text: 'Wellcome back'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "last see 11:27 AM",
                    style: TextStyle(
                        fontSize: 10.0,
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontFamily: "avengers"),
                  )
                ])),
          ])),
          const Align(alignment: Alignment(0, -.5), child: Icon((Icons.menu)))
        ],

        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // children: [
        //   IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        // ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);

  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
