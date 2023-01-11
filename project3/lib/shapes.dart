import 'package:flutter/material.dart';

class RightBoltShape extends CustomPainter {
  final Color? color;

  RightBoltShape({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();

    path_0.moveTo(size.width * 0.2, 0);
    path_0.lineTo(size.width + (size.width * .2), 0);
    path_0.lineTo(size.width - (size.width * .1),
        (size.height / 2) + (size.height * 0.1));
    path_0.lineTo(size.width + (size.width * .1),
        (size.height / 2) - (size.height * 0.1));

    path_0.lineTo(size.width - (size.width * .2), size.height);
    path_0.lineTo(0 - size.width * .2, size.height);

    path_0.close();

    Paint paint0Fill = Paint();
    canvas.drawPath(
        path_0,
        paint0Fill
          ..style = PaintingStyle.fill
          ..strokeWidth = 5
          ..color = color ?? Colors.pink);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LeftBoltShape extends CustomPainter {
  final Color? color;

  LeftBoltShape({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();

    path_0.moveTo(size.width * 0.2, 0);
    path_0.lineTo(size.width + (size.width * .2), 0);

    path_0.lineTo(size.width - (size.width * .2), size.height);
    path_0.lineTo(0 - size.width * .2, size.height);

    path_0.lineTo(
        0 + (size.width * .15), (size.height / 2) - (size.height * 0.2));
    path_0.lineTo(0, (size.height / 2) - (size.height * 0.1));

    path_0.close();

    Paint paint0Fill = Paint();
    canvas.drawPath(
        path_0,
        paint0Fill
          ..style = PaintingStyle.fill
          ..strokeWidth = 5
          ..color = color ?? Colors.pink);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SkewCut2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width, size.height * 0.7942440);
    path.lineTo(-20, size.height);
    path.lineTo(size.width * 0.3097017, 0);
    path.lineTo(size.width * 0.8545011, size.height * 0.2716143);
    path.lineTo(size.width, size.height * 0.7942440);

    // path.lineTo(size.width - 20, size.height);
    // path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(SkewCut2 oldClipper) => false;
}
