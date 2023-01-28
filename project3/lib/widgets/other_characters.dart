import 'package:flutter/material.dart';
import 'package:project3/screens/page2.dart';

import '../models/item_class.dart';
import '../widgets/shapes.dart';

class OtherCharactersSection extends StatelessWidget {
  const OtherCharactersSection({
    Key? key,
    // required this.shapes,
    required this.items,
  }) : super(key: key);

  // final List<CustomPaint> shapes;
  final List<MyCarouselItem> items;

  @override
  Widget build(BuildContext context) {
    final List<CustomPaint> cardShapes = otherItemsGenerator();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 150,
            // color: Colors.pink,
            width: MediaQuery.of(context).size.width,
            child: Transform(
              transform: Matrix4(
                //  the perspective and its length settings
                .775, -.088, 0,
                -0.0006,
                0, 1, 0, 0, //
                0, 0, 1, 0, //
                0, 0, 0, 1,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                itemExtent: 150,
                scrollDirection: Axis.horizontal,
                itemCount: cardShapes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  Page2(selectedItem: items[index]))));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 7.5, bottom: 7.5, right: 7.5, left: 3.75),
                      child: SizedBox(
                          // color: Colors.black.withOpacity(.1),
                          width: 150,
                          // height: 100,
                          child: cardShapes[index]),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: -30,
            left: 10,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 12.5, bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 253, 234, 8),
                  border: Border.all(
                      width: 3, color: const Color.fromARGB(255, 22, 22, 22))),
              // width: 150,
              // height: 50,
              child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Popular Heroes",
                    style: TextStyle(fontSize: 15),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  List<CustomPaint> otherItemsGenerator() {
    List<CustomPaint> otherHeroesItems = [];
    const Color shapeBorderColor = Colors.black;

    for (var i = 0; i < items.length; i++) {
      if (i == 0) {
        otherHeroesItems.add(customCardGenerator(
            painter: Shape1(color: shapeBorderColor),
            clipper: Clip1(),
            imageUrl: items[i].fullImage));
      } else if ((i + 1) % 3 == 0) {
        otherHeroesItems.add(customCardGenerator(
            painter: Shape3(color: shapeBorderColor),
            clipper: Clip3(),
            imageUrl: items[i].fullImage));
      } else if ((i + 1) % 5 == 0) {
        otherHeroesItems.add(customCardGenerator(
            painter: Shape5(color: shapeBorderColor),
            clipper: Clip5(),
            imageUrl: items[i].fullImage));
      } else if ((i + 1) % 2 == 0) {
        otherHeroesItems.add(customCardGenerator(
            painter: Shape2(color: shapeBorderColor),
            clipper: Clip2(),
            imageUrl: items[i].fullImage));
      }
    }

    return otherHeroesItems;
  }

//Too small to be a separated widget so better to be close to the main body
  customCardGenerator({
    CustomPainter? painter,
    String? imageUrl,
    CustomClipper<Path>? clipper,
  }) {
    return CustomPaint(
        painter: painter,
        child: ClipPath(
            clipper: clipper,
            child: Transform.scale(
              scale: 1.5,
              child: Image.asset(
                imageUrl ?? "",
                fit: BoxFit.fill,
              ),
            )));
  }
}
