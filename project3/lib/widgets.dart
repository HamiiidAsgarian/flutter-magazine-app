import 'dart:math';

import 'package:flutter/material.dart';

import 'dart:developer' as developer;

class MyCustomCards extends StatefulWidget {
  const MyCustomCards(
      {super.key,
      this.items = const [],
      this.currentIndex,
      this.leftOrRightResult});

  final List<Widget> items;
  final Function(MyCardsDragDirection)? leftOrRightResult;
  final Function(int)? currentIndex;

  @override
  State<MyCustomCards> createState() => _MyCustomCardsState();
}

class _MyCustomCardsState extends State<MyCustomCards>
    with TickerProviderStateMixin {
  late AnimationController _cardsChangeAnim;
  late AnimationController _returnToPositionCntrl;

  late Animation<double> _traslateAnim;
  late Animation<double> _traslateAnim1;
  late Animation<double> _traslateAnim2;
  late Animation<double> _traslateAnim3;

  late Animation<double> _rotateAnim;
  late Animation<double> _rotateAnim1;
  late Animation<double> _rotateAnim2;
  late Animation<double> _rotateAnim3;

  late Animation<Offset> _returnToOfssetPositionAnim;

  late List<Animation<double>> _translateAnims;
  late List<Animation<double>> _rotateAnims;

  late List<Widget> _items;

  @override
  void initState() {
    _cardsChangeAnim = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _returnToPositionCntrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _returnToOfssetPositionAnim =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _returnToPositionCntrl, curve: Curves.easeInOut));

    _traslateAnim = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOut));
    _traslateAnim1 = Tween<double>(begin: .9, end: 1).animate(
        CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOut));
    _traslateAnim2 = Tween<double>(begin: .8, end: .9).animate(
        CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOut));
    _traslateAnim3 = Tween<double>(begin: 0, end: .8).animate(
        CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOut));

    _rotateAnim = Tween<double>(begin: 0, end: 0).animate(
        CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
    _rotateAnim1 = Tween<double>(begin: -(pi / 7), end: 0).animate(
        CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
    _rotateAnim2 = Tween<double>(begin: (pi / 7), end: -(pi / 7)).animate(
        CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
    _rotateAnim3 = Tween<double>(begin: 0, end: (pi / 7)).animate(
        CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.easeInOutBack));

    _translateAnims = [
      _traslateAnim,
      _traslateAnim1,
      _traslateAnim2,
      _traslateAnim3,
    ];
    _rotateAnims = [_rotateAnim, _rotateAnim1, _rotateAnim2, _rotateAnim3];

    _items = widget.items;

    super.initState();
  }

  @override
  void dispose() {
    _cardsChangeAnim.dispose();
    _returnToPositionCntrl.dispose();

    super.dispose();
  }

  double _updateDx = 0.0;
  double _updateDy = 0.0;

  double _startDx = 0.0;
  double _startDy = 0.0;

  static const double _cardWith = 350.0;
  static const double _cardHeight = 500;

  static const double _skipDistance =
      100; // distance(left ot right) from center of the cart to start skip(next) animation

  int currentIndex = 1;

  //  _items = [
  //   FlutterLogo(
  //     size: 200,
  //   ),
  //   Container(
  //     color: Colors.blue,
  //     width: _cardWith,
  //     height: _cardHeight,
  //     child: const Text("3"),
  //   ),
  //   Container(
  //     color: Colors.pinkAccent,
  //     width: _cardWith,
  //     height: _cardHeight,
  //     child: const Text("4"),
  //   ),
  //   Container(
  //     color: Colors.brown,
  //     width: _cardWith,
  //     height: _cardHeight,
  //     child: const Text("5"),
  //   ),
  //   Container(
  //     color: Colors.lightBlue,
  //     width: _cardWith,
  //     height: _cardHeight,
  //     child: const Text("6"),
  //   ),
  //   Container(
  //     color: Colors.limeAccent,
  //     width: _cardWith,
  //     height: _cardHeight,
  //     child: const Text("7"),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    developer.log("***MyCustomCards Buid***");
    return Center(
      child: SizedBox(
        width: _cardWith,
        height: _cardHeight,
        child: Stack(
          children: [...cardsGenerator()],
        ),
      ),
    );
  }

  List<Widget> cardsGenerator() {
    List<Widget> cardsStack = [];
    for (int i = 2; i >= 0; i--) {
      //The card on the top
      if (i == 0) {
        cardsStack.add(GestureDetector(
          onPanDown: (details) {
            onPanDown(details);
          },
          onPanUpdate: ((details) {
            onPanUpdate(details);
          }),
          onPanEnd: (details) {
            onPanEnd();
          },
          onTap: (() async {}),
          child: AnimatedBuilder(
              animation:
                  Listenable.merge([_returnToPositionCntrl, _cardsChangeAnim]),
              builder: (context, child) {
                return Transform.translate(
                  offset:
                      _returnToPositionCntrl.status == AnimationStatus.forward
                          ? _returnToOfssetPositionAnim.value
                          : Offset(_updateDx, _updateDy),
                  child: Transform.rotate(
                    origin: const Offset(0,
                        _cardHeight), //Pivot point to the center button of the cards
                    angle: _rotateAnim.value,
                    child: _items[i],
                  ),
                );
              }),
        ));
      } else {
        //Cards NOT on the top
        cardsStack.add(AnimatedBuilder(
          animation: _cardsChangeAnim,
          builder: (context, child) => Transform.scale(
              scale: _translateAnims[i].value,
              child: Transform.rotate(
                origin: const Offset(0, 200),
                angle: _rotateAnims[i].value,
                child: _items[i],
              )),
        ));
      }
    }
    //The top card that appears on the buttom of the stack- there is always a static item more than actual items to help the flow of the animations
    cardsStack.insert(
        0,
        AnimatedBuilder(
          animation: _cardsChangeAnim,
          builder: (context, child) => Transform.scale(
              scale: _translateAnims[3].value,
              child: Transform.rotate(
                origin: const Offset(0, 200),
                angle: _rotateAnims[3].value,
                child: _items[
                    3], // 3 means that the 3rd item must be shown as the new element at the buttom of the stack - becase list gest updated through deleting fitst element and adding to the end of the list, the 3rd item can always considered as the last stack item
              )),
        ));
    return cardsStack;
  }

  onPanDown(DragDownDetails details) {
    setState(() {
      //Moving the center of the axis to the center of the card
      _startDx = details.localPosition.dx - (_cardWith / 2);
      _startDy = details.localPosition.dy - (_cardHeight / 2);
    });
  }

  onPanUpdate(DragUpdateDetails details) {
    setState(() {
      // to start moving the card from the selected pixle without jump
      _updateDx = (details.localPosition.dx - (_cardWith / 2)) - _startDx;
      _updateDy = (details.localPosition.dy - (_cardHeight / 2)) - _startDy;
    });
  }

  onPanEnd() async {
    if (_updateDx > _skipDistance) {
      _rotateAnim = Tween<double>(begin: 0, end: pi / 1.5).animate(
          CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.linear));

      if (widget.leftOrRightResult != null) {
        widget.leftOrRightResult!(MyCardsDragDirection.right);
      }
      currentIndex = (currentIndex % _items.length) + 1;
      if (widget.currentIndex != null) {
        widget.currentIndex!(currentIndex);
      }
      await _cardsChangeAnim.forward();
    } else if (_updateDx < -_skipDistance) {
      _rotateAnim = Tween<double>(begin: 0, end: -pi / 1.5).animate(
          CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.linear));

      if (widget.leftOrRightResult != null) {
        widget.leftOrRightResult!(MyCardsDragDirection.left);
      }
      currentIndex = (currentIndex % _items.length) + 1;
      if (widget.currentIndex != null) {
        widget.currentIndex!(currentIndex);
      }
      await _cardsChangeAnim.forward();
    }

    if (_updateDx > _skipDistance || _updateDx < -_skipDistance) {
      // currentIndex = (currentIndex % _items.length) + 1;
      // if (widget.currentIndex != null) {
      //   widget.currentIndex!(currentIndex);
      // }

      setState(() {
        _updateDy = 0;
        _updateDx = 0;

        var temp = _items.first;
        _items.removeAt(0);
        _items.add(temp);

        _cardsChangeAnim.reset();
      });

      // currentIndex++;
    } else {
      _returnToPositionCntrl.reset();

      _returnToOfssetPositionAnim = Tween<Offset>(
              begin: Offset(_updateDx, _updateDy), end: const Offset(0, 0))
          .animate(CurvedAnimation(
              parent: _returnToPositionCntrl, curve: Curves.easeInOut));
      _returnToPositionCntrl.forward();

      setState(() {});
      _updateDy = 0;
      _updateDx = 0;
    }
  }
}

enum MyCardsDragDirection { left, right }
