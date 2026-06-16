import 'package:flutter/material.dart';
import 'package:pichair/presentation/left/control_touch_page/widgets/left_line_painter.dart';

class LeftControlButtonLine extends StatelessWidget {
  const LeftControlButtonLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: LeftLinePainter(
            start: Offset(200, 75),
            end: Offset(290, 75),
          ),
        ),
        CustomPaint(
          painter: LeftLinePainter(
            start: Offset(200, 75),
            end: Offset(120, 130),
          ),
        ),
        CustomPaint(
          painter: LeftLinePainter(
            start: Offset(70, 285),
            end: Offset(165, 285),
          ),
        ),
        CustomPaint(
          painter: LeftLinePainter(
            start: Offset(100, 285),
            end: Offset(150, 230),
          ),
        ),
        CustomPaint(
          painter: LeftLinePainter(
            start: Offset(430, 75),
            end: Offset(520, 75),
          ),
        ),
        CustomPaint(
          painter: LeftLinePainter(
            start: Offset(190, 170),
            end: Offset(430, 75),
          ),
        ),
        CustomPaint(
          painter: LeftLinePainter(
            start: Offset(430, 135),
            end: Offset(520, 135),
          ),
        ),
        CustomPaint(
          painter: LeftLinePainter(
            start: Offset(430, 135),
            end: Offset(260, 220),
          ),
        ),
        CustomPaint(
          painter: LeftLinePainter(
            start: Offset(430, 195),
            end: Offset(520, 195),
          ),
        ),
        CustomPaint(
          painter: LeftLinePainter(
            start: Offset(430, 195),
            end: Offset(370, 255),
          ),
        ),
      ],
    );
  }
}
