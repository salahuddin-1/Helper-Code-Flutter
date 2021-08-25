import 'package:flutter/material.dart';

// The canvas that is your board.
// The paint that is your brush.
// The path that is your drawing.
// The size that is your board size.

// Initially the starting position of the pointer is 0, 0 => topLeft corner
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Brush
    var paint = Paint();
    paint.color = Colors.orange;
    paint.style = PaintingStyle.fill;

    // Set properties to paint
    // Drawing
    var path = Path();
    path.moveTo(0, size.height / 4);

    path.quadraticBezierTo(
      size.width / 2,
      size.height / 2,
      size.width,
      size.height / 4,
    );

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    // Draw your path
    // Board
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) {
    return true;
  }
}

class CurvePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.orange;
    paint.style = PaintingStyle.fill;
    var path = Path();

    path.moveTo(0, size.height * 0.9177);
    path.quadraticBezierTo(
      size.width / 4,
      size.height * 0.875,
      size.width / 2,
      size.height * 0.9177,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.9584,
      size.width,
      size.height * 0.9177,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) {
    return true;
  }
}
