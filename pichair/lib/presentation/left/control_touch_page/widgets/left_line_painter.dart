import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftLinePainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final double? strokeWidth;

  LeftLinePainter({
    required this.start,
    required this.end,
    this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Get.theme.hoverColor.withAlpha(130)
      ..strokeWidth = strokeWidth ?? 0.6
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant LeftLinePainter oldDelegate) {
    return oldDelegate.start != start || oldDelegate.end != end;
  }
}
