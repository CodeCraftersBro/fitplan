

import 'package:flutter/material.dart';

enum LineDirection { up, down, middle }

Widget buildDashedLineIndicator(
    LineDirection direction, double height, BuildContext context) {
  return CustomPaint(
    size: Size(0, height),
    painter: DashedLinePainter(
      direction: direction,
      height: height,
      lineColor: Theme.of(context).colorScheme.primary,
    ),
  );
}



class DashedLinePainter extends CustomPainter {
  final LineDirection direction;
  final double height;
  final Color lineColor;
  DashedLinePainter({
    required this.direction,
    required this.height,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 2;
    var dashWidth = 8.0;
    var dashSpace = 2.0;
    double startY = 0;

    // Определяем начальную и конечную точки в зависимости от направления
    switch (direction) {
      case LineDirection.up:
        startY = height / 2 + 4; //+2 fix
        while (startY >= 0) {
          canvas.drawLine(
              Offset(0, startY), Offset(0, startY - dashWidth), paint);
          startY -= (dashWidth + dashSpace);
        }
        break;
      case LineDirection.down:
        startY = height / 2 - 4; //-2 fix
        while (startY <= height) {
          canvas.drawLine(
              Offset(0, startY), Offset(0, startY + dashWidth), paint);
          startY += (dashWidth + dashSpace);
        }
        break;
      case LineDirection.middle:
        while (startY <= height) {
          canvas.drawLine(
              Offset(0, startY), Offset(0, startY + dashWidth), paint);
          startY += (dashWidth + dashSpace);
        }
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
