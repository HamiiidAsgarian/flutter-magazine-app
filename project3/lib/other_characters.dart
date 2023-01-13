import 'package:flutter/material.dart';

class OtherCharactersSection extends StatelessWidget {
  const OtherCharactersSection({
    Key? key,
    required this.shapes,
  }) : super(key: key);

  final List shapes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Transform(
          //   transform: Matrix4(
          //     .8, -.09, 0, -0.0005, //
          //     0, 1, 0, 0, //
          //     0, 0, 1, 0, //
          //     0, 0, 0, 1,
          //   ),
          //   child: Container(
          //     height: 165,
          //     decoration: const BoxDecoration(
          //         // color: Colors.red,
          //         border: Border(
          //       top: BorderSide(width: 4.0, color: Colors.black),
          //     )),
          //   ),
          // ),
          SizedBox(
            height: 150,
            // color: Colors.pink,
            width: MediaQuery.of(context).size.width,
            child: Transform(
              // transform: Matrix4(
              //   1, 0, 0, 0, //
              //   0, 1, 0, 0, //
              //   0, 0, 1, 0, //
              //   0, 0, 0, 1,
              // ),

              transform: Matrix4(
                .775, -.088, 0, -0.0006, //
                0, 1, 0, 0, //
                0, 0, 1, 0, //
                0, 0, 0, 1,
              ),

              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 0),
                itemExtent: 150,
                scrollDirection: Axis.horizontal,
                itemCount: shapes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print("object $index");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 7.5, bottom: 7.5, right: 7.5, left: 3.75),
                      child: SizedBox(
                          // color: Colors.black.withOpacity(.1),
                          width: 150,
                          // height: 100,
                          child:
                              // () {
                              //   print(index);

                              //   if (index == 0) {
                              //     return CustomPaint(
                              //         painter: Shape1(color: Colors.black),
                              //         child: ClipPath(
                              //             clipper: Clip1(),
                              //             child: Transform.scale(
                              //               scale: 1.5,
                              //               child: Image.asset(
                              //                 "images/l1.png",
                              //                 fit: BoxFit.fill,
                              //               ),
                              //             )));
                              //   } else if (modulo(index + 1, 2) == 0) {
                              //     return CustomPaint(
                              //         painter: Shape2(color: Colors.black),
                              //         child: ClipPath(
                              //             clipper: Clip2(),
                              //             child: Transform.scale(
                              //               scale: 1.5,
                              //               child: Image.asset(
                              //                 "images/l1.png",
                              //                 fit: BoxFit.fill,
                              //               ),
                              //             )));
                              //   } else if (modulo(index + 1, 3) == 0) {
                              //     return CustomPaint(
                              //         painter: Shape3(color: Colors.black),
                              //         child: ClipPath(
                              //             clipper: Clip3(),
                              //             child: Transform.scale(
                              //               scale: 1.5,
                              //               child: Image.asset(
                              //                 "images/l1.png",
                              //                 fit: BoxFit.fill,
                              //               ),
                              //             )));
                              //   } else if (modulo(index + 1, 5) == 0) {
                              //     return CustomPaint(
                              //         painter: Shape5(color: Colors.black),
                              //         child: ClipPath(
                              //             clipper: Clip5(),
                              //             child: Transform.scale(
                              //               scale: 1.5,
                              //               child: Image.asset(
                              //                 "images/l1.png",
                              //                 fit: BoxFit.fill,
                              //               ),
                              //             )));
                              //   }
                              // }()

                              shapes[index]),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: -30,
            left: 10,
            // alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 12.5, bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 216, 197, 8),
                  border: Border.all(
                      width: 3, color: const Color.fromARGB(255, 22, 22, 22))),
              // width: 150,
              // height: 50,
              child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Other Heroes",
                    style: TextStyle(fontSize: 15),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
