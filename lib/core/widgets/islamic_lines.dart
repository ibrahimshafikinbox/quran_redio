import 'package:flutter/material.dart';

class IslamicCurvedLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final mainPaint = Paint()
      ..color = Colors.white.withOpacity(0.08)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final secondaryPaint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    _drawCurvedGrid(canvas, size, mainPaint, secondaryPaint);
  }

  void _drawCurvedGrid(
    Canvas canvas,
    Size size,
    Paint mainPaint,
    Paint secondaryPaint,
  ) {
    final double w = size.width;
    final double h = size.height;

    for (int i = 0; i < 8; i++) {
      final double yOffset = (h / 7) * i;
      final path = Path();
      path.moveTo(-20, yOffset);

      for (double x = 0; x <= w + 40; x += 60) {
        final double controlY1 = yOffset - 25;
        final double controlY2 = yOffset + 25;
        path.quadraticBezierTo(x + 15, controlY1, x + 30, yOffset);
        path.quadraticBezierTo(x + 45, controlY2, x + 60, yOffset);
      }

      canvas.drawPath(path, i % 2 == 0 ? mainPaint : secondaryPaint);
    }

    for (int i = 0; i < 12; i++) {
      final double xOffset = (w / 10) * i;
      final path = Path();
      path.moveTo(xOffset, -20);

      for (double y = 0; y <= h + 40; y += 50) {
        final double controlX1 = xOffset - 20;
        final double controlX2 = xOffset + 20;
        path.quadraticBezierTo(controlX1, y + 12.5, xOffset, y + 25);
        path.quadraticBezierTo(controlX2, y + 37.5, xOffset, y + 50);
      }

      canvas.drawPath(path, i % 2 == 0 ? secondaryPaint : mainPaint);
    }

    for (int i = -4; i < 10; i++) {
      final path = Path();
      final double startX = (w / 6) * i;
      path.moveTo(startX, -20);

      double x = startX;
      double y = 0;

      while (y < h + 50 && x < w + 100) {
        path.quadraticBezierTo(x + 30, y + 20, x + 50, y + 50);
        x += 50;
        y += 50;
      }

      canvas.drawPath(path, secondaryPaint);
    }

    for (int i = -2; i < 12; i++) {
      final path = Path();
      final double startX = w - (w / 6) * i;
      path.moveTo(startX, -20);

      double x = startX;
      double y = 0;

      while (y < h + 50 && x > -100) {
        path.quadraticBezierTo(x - 30, y + 20, x - 50, y + 50);
        x -= 50;
        y += 50;
      }

      canvas.drawPath(path, secondaryPaint);
    }

    final dotPaint = Paint()
      ..color = Colors.white.withOpacity(0.06)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 5; j++) {
        final double x = (w / 7) * i + 20;
        final double y = (h / 4) * j + 10;
        canvas.drawCircle(Offset(x, y), 2, dotPaint);
      }
    }

    _drawCornerArch(canvas, size, mainPaint);
  }

  void _drawCornerArch(Canvas canvas, Size size, Paint paint) {
    final archPath1 = Path();
    archPath1.moveTo(size.width - 60, 0);
    archPath1.quadraticBezierTo(size.width - 30, 30, size.width, 30);
    canvas.drawPath(archPath1, paint);

    final archPath2 = Path();
    archPath2.moveTo(0, size.height - 30);
    archPath2.quadraticBezierTo(30, size.height - 30, 60, size.height);
    canvas.drawPath(archPath2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
