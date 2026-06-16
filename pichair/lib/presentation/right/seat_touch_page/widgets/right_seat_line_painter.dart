import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RightSeatLinePainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final double? strokeWidth;
  final Color? stokeColor;

  RightSeatLinePainter({
    required this.start,
    required this.end,
    this.strokeWidth,
    this.stokeColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Get.theme.hoverColor.withAlpha(130)
      ..strokeWidth = strokeWidth ?? 0.9
      ..color = stokeColor ?? Colors.white
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant RightSeatLinePainter oldDelegate) {
    return oldDelegate.start != start || oldDelegate.end != end;
  }
}
