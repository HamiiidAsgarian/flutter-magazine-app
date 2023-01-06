import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project3/widgets.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.selectedItem});
  final Widget selectedItem;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyCarousel2(),
    );
  }
}

class MyCarousel2 extends StatefulWidget {
  const MyCarousel2({super.key});

  @override
  State<MyCarousel2> createState() => _MyCarousel2State();
}

class _MyCarousel2State extends State<MyCarousel2>
    with TickerProviderStateMixin {
  late AnimationController _mainAnimCntrl;

  //Each animation card is made of two different components. because it is not possible to change two cards z-index(stack order) in a "Not boolean" way, there are total number of 4 cards.
// when first pair cards reach to their 90(pi/2) degree of rotation, they stop being visible then the other two cards, with reveresed order, start reversed animation which appears to be an smooth transition.
  late Animation<double> _rotateAnimPhase1;
  late Animation<double> _rotateAnimPhase2;

  late Animation<double> _translateXAnimPhase1;
  late Animation<double> _translateXAnimPhase2;

//How much close are cards to each other in z-direction.
  final double _cardsTravelDestence = 30;
  final double widthSize = double.infinity;

  @override
  void initState() {
    _mainAnimCntrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _rotateAnimPhase1 = Tween<double>(begin: 0.0, end: pi / 2).animate(
        CurvedAnimation(
            parent: _mainAnimCntrl, curve: const Interval(0.0, .5)));
    _rotateAnimPhase2 = Tween<double>(begin: pi / 2, end: 0.0).animate(
        CurvedAnimation(
            parent: _mainAnimCntrl, curve: const Interval(0.5, 1.0)));

    _translateXAnimPhase1 = Tween<double>(begin: 0.0, end: _cardsTravelDestence)
        .animate(CurvedAnimation(
            parent: _mainAnimCntrl, curve: const Interval(0.0, .5)));
    _translateXAnimPhase2 = Tween<double>(begin: _cardsTravelDestence, end: 0.0)
        .animate(CurvedAnimation(
            parent: _mainAnimCntrl, curve: const Interval(0.5, 1.0)));

    super.initState();
  }

  @override
  void dispose() {
    _mainAnimCntrl.dispose();
    super.dispose();
  }

  MyCardsDragDirection _dragDirection =
      MyCardsDragDirection.right; //just an initial value to not be null
  List<Widget> rawItems = [
    Container(
      width: 400,
      height: 400,
      color: Colors.pinkAccent,
      child: const Text("1"),
    ),
    Container(
        width: 400,
        height: 400,
        color: Colors.lightGreenAccent,
        child: const Text("2")),
    Container(
        width: 400,
        height: 400,
        color: Colors.blueAccent,
        child: const Text("3")),
    Container(
        width: 400,
        height: 400,
        color: Colors.yellowAccent,
        child: const Text("4")),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            FloatingActionButton(onPressed: () {
              // onDragRight();
              onDrag(MyCardsDragDirection.left);
            }),
            FloatingActionButton(onPressed: () {
              onDrag(MyCardsDragDirection.right);
              // onDragLeft();
            }),
          ]),
        ),
        Center(child: _carsGenerator()),
      ],
    );
  }

  AnimatedBuilder _carsGenerator() {
    AnimatedBuilder res = AnimatedBuilder(
      animation: _mainAnimCntrl,
      builder: ((context, child) {
        bool myConditionAnim1 = _dragDirection == MyCardsDragDirection.right
            ? _rotateAnimPhase1.value == pi / 2
            : _rotateAnimPhase1.value == -(pi / 2);
        bool myConditionAnim2 = _dragDirection == MyCardsDragDirection.right
            ? _rotateAnimPhase2.value == (pi / 2)
            : _rotateAnimPhase2.value == -(pi / 2);
        int nextCardIndex = _dragDirection == MyCardsDragDirection.right
            ? rawItems.length - 1
            : 1;

        return Stack(
          children: [
            MyCard2(
                myConditionAnim1: myConditionAnim1,
                translateXAnim: _translateXAnimPhase1.value,
                rotateAnim1: _rotateAnimPhase1.value,
                child: rawItems[nextCardIndex]),
            GestureDetector(
              //Top Card is touch sensetive
              onHorizontalDragEnd: (e) {
                print(e.primaryVelocity);
                if (e.primaryVelocity! > 0) {
                  onDrag(MyCardsDragDirection.left);
                } else {
                  onDrag(MyCardsDragDirection.right);
                }
              },
              child: MyCard2(
                  myConditionAnim1: myConditionAnim1,
                  translateXAnim: -_translateXAnimPhase1.value,
                  rotateAnim1: _rotateAnimPhase1.value,
                  child: rawItems[0]),
            ),
            MyCard2(
                myConditionAnim1: myConditionAnim2,
                translateXAnim: -_translateXAnimPhase2.value,
                rotateAnim1: -_rotateAnimPhase2.value,
                child: rawItems[0]),
            MyCard2(
                myConditionAnim1: myConditionAnim2,
                translateXAnim: _translateXAnimPhase2.value,
                rotateAnim1: -_rotateAnimPhase2.value,
                child: rawItems[nextCardIndex]),
          ],
        );
      }),
    );

    return res;
  }

  onDrag(MyCardsDragDirection direction) async {
    print(direction);
    double angle =
        direction == MyCardsDragDirection.left ? (-pi / 2) : (pi / 2);
    double cardsTravelDestence = direction == MyCardsDragDirection.left
        ? (-_cardsTravelDestence)
        : (_cardsTravelDestence);

    _rotateAnimPhase1 = Tween<double>(begin: 0.0, end: angle).animate(
        CurvedAnimation(
            parent: _mainAnimCntrl, curve: const Interval(0.0, .5)));
    _rotateAnimPhase2 = Tween<double>(begin: angle, end: 0.0).animate(
        CurvedAnimation(
            parent: _mainAnimCntrl, curve: const Interval(0.5, 1.0)));

    _translateXAnimPhase1 = Tween<double>(begin: 0.0, end: cardsTravelDestence)
        .animate(CurvedAnimation(
            parent: _mainAnimCntrl,
            curve: const Interval(0.0, .5, curve: Curves.easeOut)));
    _translateXAnimPhase2 = Tween<double>(begin: cardsTravelDestence, end: 0.0)
        .animate(CurvedAnimation(
            parent: _mainAnimCntrl,
            curve: const Interval(0.5, 1.0, curve: Curves.easeIn)));

    setState(() {
      _dragDirection = direction;
    });
    print(_dragDirection);
    await _mainAnimCntrl.forward();
    _mainAnimCntrl.reset();

    if (direction == MyCardsDragDirection.left) {
      print("left");

      setState(() {
        Widget temp = rawItems.first;

        rawItems.removeAt(0);
        rawItems.add(temp);
      });
    } else {
      print("right");
      setState(() {
        Widget temp = rawItems.last;

        rawItems.removeLast();
        rawItems.insert(0, temp);
      });
    }

    // direction == MyCardsDragDirection.left ? onDragLeft() : onDragRight();
  }
}

class MyCard2 extends StatelessWidget {
  const MyCard2({
    Key? key,
    required this.myConditionAnim1,
    required double translateXAnim,
    required double rotateAnim1,
    required this.child,
  })  : _translateXAnim = translateXAnim,
        _rotateAnim1 = rotateAnim1,
        super(key: key);

  final bool myConditionAnim1;
  final double _translateXAnim;
  final double _rotateAnim1;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !(myConditionAnim1),
      child: Transform(
          alignment: Alignment.center,
          transform: Matrix4(
            1.0,
            0,
            0,
            0,
            0,
            1.0,
            0,
            0,
            0,
            0,
            1,
            0.0015, //Depth of perspective effect - higher value,the higher the perspective
            _translateXAnim,
            0,
            0,
            1,
          )..rotateY(_rotateAnim1),
          child: child),
    );
  }
}
