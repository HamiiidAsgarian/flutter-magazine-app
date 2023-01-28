import 'dart:math';

import 'package:flutter/material.dart';

import 'dart:developer' as developer;

import 'package:project3/models/item_class.dart';
import 'package:project3/widgets/shapes.dart';

enum CardsSelectionStatus { selected, unSelected }

class MyCustomCards extends StatefulWidget {
  // ignore: library_private_types_in_public_api
  static final GlobalKey<_MyCustomCardsState> myCarousleKey =
      GlobalKey(); //NOTE this is because i want to call [cardOpening] function from the Carousel widget to be more orginized. with this key i access the  [cardOpening] function AFTER pop from the Page2(**push.then**),this might cause unstability so I NOTE this

  MyCustomCards(
      {this.items = const [],
      this.currentIndex,
      this.onTap,
      this.leftOrRightResult})
      : super(key: myCarousleKey);

  final List<MyCarouselItem> items;
  final Function(MyCardsDragDirection)? leftOrRightResult;
  final Function(int)? currentIndex;
  final Function(CardsSelectionStatus)? onTap;

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

  // late List<Widget> _items;
  // late List<Widget> _widgetedItems;

  late List<MyCarouselItem> _itemsStackCardOrder;
  final int _cardsDiviationValue = 15;

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
    _rotateAnim1 = Tween<double>(begin: -(pi / _cardsDiviationValue), end: 0)
        .animate(CurvedAnimation(
            parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
    _rotateAnim2 = Tween<double>(
            begin: (pi / _cardsDiviationValue),
            end: -(pi / _cardsDiviationValue))
        .animate(CurvedAnimation(
            parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
    _rotateAnim3 = Tween<double>(begin: 0, end: (pi / _cardsDiviationValue))
        .animate(CurvedAnimation(
            parent: _cardsChangeAnim, curve: Curves.easeInOutBack));

    _translateAnims = [
      _traslateAnim,
      _traslateAnim1,
      _traslateAnim2,
      _traslateAnim3,
    ];
    _rotateAnims = [_rotateAnim, _rotateAnim1, _rotateAnim2, _rotateAnim3];

    // _widgetedItems = widget.items;

    _itemsStackCardOrder = widget.items.map((e) => e).toList();

    // Container(
    //         // color: myColors[0],
    //         width: _cardWith,
    //         height: _cardHeight,
    //         child: Image.asset(e.backgroundImageUrl ?? ""),
    //       )

    // cardOpening(); ////NOTE HOW to open card on init

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

  static const double _cardWith = 400;
  static const double _cardHeight = 400;

  static const double _skipDistance =
      50; // distance(left ot right) from center of the cart to start skip(next) animation

  int currentIndex = 0;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    developer.log("***MyCustomCards Buid***");
    return SizedBox(
      // color: Colors.teal,
      // width: _cardWith,
      // height: _cardHeight,
      child: Center(
        child: Stack(
          children: cardsGenerator(),
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
          onTapUp: (details) async {
            onTapUp();
          },
          onPanDown: (details) {
            if (!_isSelected) {
              onPanDown(details);
            }
          },
          onPanUpdate: ((details) {
            if (!_isSelected) {
              onPanUpdate(details);
            }
          }),
          onPanEnd: (details) {
            if (!_isSelected) {
              onPanEnd();
            }
          },
          child: AnimatedBuilder(
              animation:
                  Listenable.merge([_returnToPositionCntrl, _cardsChangeAnim]),
              builder: (context, child) {
                return DynamicCardOnTop(
                  data: _itemsStackCardOrder[i],
                  cardWith: _cardWith,
                  cardHeight: _cardHeight,
                  dxPosition: _updateDx,
                  dyPosition: _updateDy,
                  translateOffset:
                      _returnToPositionCntrl.status == AnimationStatus.forward
                          ? _returnToOfssetPositionAnim.value
                          : Offset(_updateDx, _updateDy),
                  rotateAngle: _rotateAnim.value,
                );
              }),
        ));
      } else {
        //Cards NOT on the top
        cardsStack.add(AnimatedBuilder(
          animation: _cardsChangeAnim,
          builder: (context, child) => DynamicCardNotOnTop(
            data: _itemsStackCardOrder[i],
            cardWith: _cardWith,
            cardHeight: _cardHeight,
            scaleValue: _translateAnims[i].value,
            rotateValue: _rotateAnims[i].value,
          ),
        ));
      }
    }
    //The former top card that appears on the buttom of the stack- there is always a static item more than actual items to help the flow of the animations
    cardsStack.insert(
        0,
        AnimatedBuilder(
          animation: _cardsChangeAnim,
          builder: (context, child) => DynamicCardNotOnTop(
            data: _itemsStackCardOrder[3],
            cardWith: _cardWith,
            cardHeight: _cardHeight,
            scaleValue: _translateAnims[3].value,
            rotateValue: _rotateAnims[3].value,
          ),
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
    // print("ci1 $currentIndex");
    if (_updateDx > _skipDistance) {
      _rotateAnim = Tween<double>(begin: 0, end: pi / 1.5).animate(
          CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.linear));

      if (widget.leftOrRightResult != null) {
        widget.leftOrRightResult!(MyCardsDragDirection
            .right); //For parrent awareness of drag direction only
      }
      if (currentIndex < _itemsStackCardOrder.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }

      // currentIndex = (currentIndex % _itemsStackCardOrder.length) + 1;
      // if (widget.currentIndex != null) {
      widget.currentIndex!(currentIndex);
      // }
      await _cardsChangeAnim.forward();
    } else if (_updateDx < -_skipDistance) {
      _rotateAnim = Tween<double>(begin: 0, end: -pi / 1.5).animate(
          CurvedAnimation(parent: _cardsChangeAnim, curve: Curves.linear));

      if (widget.leftOrRightResult != null) {
        widget.leftOrRightResult!(MyCardsDragDirection
            .left); //For parrent awareness of drag direction only
      }

      if (currentIndex < _itemsStackCardOrder.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }

      // currentIndex = (currentIndex % _itemsStackCardOrder.length) + 1;
      // if (widget.currentIndex != null) {
      widget.currentIndex!(currentIndex);
      // }
      await _cardsChangeAnim.forward();
    }
    // print("ci - $currentIndex");

    if (_updateDx > _skipDistance || _updateDx < -_skipDistance) {
      // currentIndex = (currentIndex % _items.length) + 1;
      // if (widget.currentIndex != null) {
      //   widget.currentIndex!(currentIndex);
      // }

      setState(() {
        _updateDy = 0;
        _updateDx = 0;

        MyCarouselItem temp = _itemsStackCardOrder.first;
        _itemsStackCardOrder.removeAt(0);
        _itemsStackCardOrder.add(temp);

        _cardsChangeAnim.reset();
      });
    } else {
      _returnToPositionCntrl.reset();

      _returnToOfssetPositionAnim = Tween<Offset>(
              begin: Offset(_updateDx, _updateDy), end: const Offset(0, 0))
          .animate(CurvedAnimation(
              parent: _returnToPositionCntrl, curve: Curves.easeOutBack));
      _returnToPositionCntrl.forward();

      setState(() {});
      _updateDy = 0;
      _updateDx = 0;
    }
  }

  onTapUp() async {
//For grouping cards together when they become selected
    if (!_isSelected) {
      // if (widget.onTap != null) {
      //   // await cardOpening();
      //   // widget.onTap!(CardsSelectionStatus.selected);
      // }

      _isSelected = true;
      _cardsChangeAnim.reset();
      setState(() {
        _isSelected = true;
        _rotateAnim = Tween<double>(begin: 0, end: 0).animate(CurvedAnimation(
            parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
        _rotateAnim1 =
            Tween<double>(begin: -(pi / _cardsDiviationValue), end: 0).animate(
                CurvedAnimation(
                    parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
        _rotateAnim2 = Tween<double>(begin: (pi / _cardsDiviationValue), end: 0)
            .animate(CurvedAnimation(
                parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
        _rotateAnim3 = Tween<double>(begin: 0, end: 0).animate(CurvedAnimation(
            parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
      });

      _rotateAnims = [_rotateAnim, _rotateAnim1, _rotateAnim2, _rotateAnim3];

      await _cardsChangeAnim.forward();
      widget.onTap!(CardsSelectionStatus.selected);
    } else {
      cardOpening();
    }
  }

  cardOpening() async {
    await _cardsChangeAnim.reverse();

    setState(() {
      _rotateAnim = Tween<double>(begin: 0, end: 0).animate(CurvedAnimation(
          parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
      _rotateAnim1 = Tween<double>(begin: -(pi / _cardsDiviationValue), end: 0)
          .animate(CurvedAnimation(
              parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
      _rotateAnim2 = Tween<double>(
              begin: (pi / _cardsDiviationValue),
              end: -(pi / _cardsDiviationValue))
          .animate(CurvedAnimation(
              parent: _cardsChangeAnim, curve: Curves.easeInOutBack));
      _rotateAnim3 = Tween<double>(begin: 0, end: (pi / _cardsDiviationValue))
          .animate(CurvedAnimation(
              parent: _cardsChangeAnim, curve: Curves.easeInOutBack));

      _rotateAnims = [_rotateAnim, _rotateAnim1, _rotateAnim2, _rotateAnim3];

      _isSelected = false;
    });
  }
}

class DynamicCardNotOnTop extends StatelessWidget {
  const DynamicCardNotOnTop({
    Key? key,
    required double scaleValue,
    required double rotateValue,
    required double cardWith,
    required double cardHeight,
    required MyCarouselItem data,
  })  : _scaleValue = scaleValue,
        _rotateValue = rotateValue,
        _cardWith = cardWith,
        _cardHeight = cardHeight,
        _data = data,
        super(key: key);

  final double _scaleValue;
  final double _rotateValue;
  final double _cardWith;
  final double _cardHeight;
  final MyCarouselItem _data;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: _scaleValue,
        child: Transform.rotate(
            origin: const Offset(0, 200),
            angle: _rotateValue,
            child: Stack(children: [
              _data.backgroundImageUrl != ""
                  ? SizedBox(
                      // color: Colors.green,
                      width: _cardWith,
                      height: _cardHeight,
                      child: Image.asset(_data.backgroundImageUrl ?? ""),
                    )
                  : const SizedBox(),
              // _widgetedItems[i],
              _data.foregroundImageUrl != ""
                  ? Positioned.fill(
                      child: Image.asset(_data.foregroundImageUrl ?? ""),
                    )
                  : const SizedBox(),

              _data.topGroundImageUrl != ""
                  ? Positioned.fill(
                      child: Image.asset(_data.topGroundImageUrl ?? ""),
                    )
                  : const SizedBox(),
            ])));
  }
}

class DynamicCardOnTop extends StatelessWidget {
  const DynamicCardOnTop({
    Key? key,
    required MyCarouselItem data,
    required double cardWith,
    required double cardHeight,
    required double dxPosition,
    required double dyPosition,
    required Offset translateOffset,
    required double rotateAngle,
  })  : _cardWith = cardWith,
        _cardHeight = cardHeight,
        _updateDx = dxPosition,
        _updateDy = dyPosition,
        _translateOffset = translateOffset,
        _rotateAngle = rotateAngle,
        _data = data,
        super(key: key);

  final double _cardWith;
  final double _cardHeight;
  final MyCarouselItem _data;
  final double _updateDx;
  final double _updateDy;

  final Offset _translateOffset;
  final double _rotateAngle;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: _translateOffset,
      child: Transform.rotate(
          origin: Offset(
              0, _cardHeight), //Pivot point to the center button of the cards
          angle: _rotateAngle,
          child: Stack(children: [
            _data.backgroundImageUrl != ""
                ? Container(
                    // color: Colors.green,
                    width: _cardWith,
                    height: _cardHeight,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(_data.backgroundImageUrl ?? ""))),
                  )
                : const SizedBox(),
            _data.foregroundImageUrl != ""
                ? Positioned.fill(
                    child: Hero(
                      tag: 'hero1',
                      child: Center(
                        child: Transform.translate(
                            offset: Offset(_updateDx / 4, _updateDy / 4),
                            child: Center(
                                child: Image.asset(
                                    _data.foregroundImageUrl ?? ""))),
                      ),
                    ),
                  )
                : const SizedBox(),
            _data.topGroundImageUrl != ""
                ? Positioned.fill(
                    child: Center(
                      child: Transform.translate(
                          offset: Offset(_updateDx / 2, _updateDy / 2),
                          child: Center(
                              child:
                                  Image.asset(_data.topGroundImageUrl ?? ""))),
                    ),
                  )
                : const SizedBox(),
          ])),
    );
  }
}

class GeanraSection extends StatelessWidget {
  const GeanraSection({
    required this.geanras,
    Key? key,
  }) : super(key: key);
  final List<String> geanras;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 7.1,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          height: 50,
          width: double.infinity,
          // color: Colors.green.withOpacity(.1),
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: GeanrasShape(color: Colors.pink),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Transform(
                  transform: Matrix4(
                    1, -.07, 0, 0.0, //
                    0, 1, 0, 0, //
                    0, 0, 1, 0.01, //
                    0, 0, 0, 1,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(),
                    height: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: geanras
                          .map((e) => TextButton(
                                onPressed: (() {}),
                                child: Text(e),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

enum MyCardsDragDirection { left, right }
