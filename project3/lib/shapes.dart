import 'package:flutter/material.dart';

class Shape1 extends CustomPainter {
  final Color? color;

  Shape1({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width + (size.width * .2), size.height);
    path.lineTo(0, size.height);

    path.close();

    Paint paint0Fill = Paint();
    canvas.drawPath(
        path,
        paint0Fill
          ..style = PaintingStyle.stroke
          ..strokeWidth = 7.5
          ..color = color ?? Colors.pink);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Shape2 extends CustomPainter {
  final Color? color;

  Shape2({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - (size.width * .2), size.height);
    path.lineTo(0 + (size.width * .2), size.height);

    path.close();

    Paint paint0Fill = Paint();
    canvas.drawPath(
        path,
        paint0Fill
          ..style = PaintingStyle.stroke
          ..strokeWidth = 7.5
          ..color = color ?? Colors.pink);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Shape3 extends CustomPainter {
  final Color? color;

  Shape3({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width + (size.width * .2), size.height);
    path.lineTo(0 - (size.width * .2), size.height);

    path.close();

    Paint paint0Fill = Paint();
    canvas.drawPath(
        path,
        paint0Fill
          ..style = PaintingStyle.stroke
          ..strokeWidth = 7.5
          ..color = color ?? Colors.pink);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Shape5 extends CustomPainter {
  final Color? color;

  Shape5({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - (size.width * .2), size.height);
    path.lineTo(0 - (size.width * .2), size.height);

    path.close();

    Paint paint0Fill = Paint();
    canvas.drawPath(
        path,
        paint0Fill
          ..style = PaintingStyle.stroke
          ..strokeWidth = 7.5
          ..color = color ?? Colors.pink);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ShapeEnd extends CustomPainter {
  final Color? color;

  ShapeEnd({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(0 - (size.width * .2), 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    Paint paint0Fill = Paint();
    canvas.drawPath(
        path,
        paint0Fill
          ..style = PaintingStyle.stroke
          ..strokeWidth = 7.5
          ..color = color ?? Colors.pink);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GeanrasShape extends CustomPainter {
  final Color? color;

  GeanrasShape({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, -size.height * .3);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(0, size.height);

    path.close();

    Paint paint0Fill = Paint();
    canvas.drawPath(
        path,
        paint0Fill
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6
          ..color = Colors.black);

    // Paint paint0Fill2 = Paint();

    canvas.drawPath(
        path,
        paint0Fill
          ..style = PaintingStyle.fill
          ..strokeWidth = 3
          ..color = color ?? Colors.pink);

    // canvas.drawLine(
    //     Offset(0, 0), Offset(size.width, -size.height * .3), paint0Fill);

    // canvas.drawLine(path, p2, paint)
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//------------------------------------------------------------------------------!SECTION
class Clip1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width + (size.width * .2), size.height);
    path.lineTo(0, size.height);
    // path.lineTo(size.width - 20, size.height);
    // path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(Clip1 oldClipper) => false;
}

class Clip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - (size.width * .2), size.height);
    path.lineTo(0 + (size.width * .2), size.height);

    // path.lineTo(size.width - 20, size.height);
    // path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(Clip2 oldClipper) => false;
}

class Clip3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width + (size.width * .2), size.height);
    path.lineTo(0 - (size.width * .2), size.height);
    // path.lineTo(size.width - 20, size.height);
    // path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(Clip3 oldClipper) => false;
}

class Clip5 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - (size.width * .2), size.height);
    path.lineTo(0 - (size.width * .2), size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(Clip5 oldClipper) => false;
}

class ClipEnd extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0 - (size.width * .2), 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    // path.lineTo(size.width - 20, size.height);
    // path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(ClipEnd oldClipper) => false;
}
//-----------------------------------------------------------------------------------!SECTION

