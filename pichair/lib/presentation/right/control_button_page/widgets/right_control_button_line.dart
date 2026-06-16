import 'package:flutter/material.dart';
import 'package:pichair/presentation/right/control_touch_page/widgets/right_line_painter.dart';

class RightControlButtonLine extends StatelessWidget {
  const RightControlButtonLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Transform.flip(
            flipX: true,
            child: Stack(
              children: [
                CustomPaint(
                  painter: RightLinePainter(
                    start: Offset(200, 75),
                    end: Offset(290, 75),
                  ),
                ),
                CustomPaint(
                  painter: RightLinePainter(
                    start: Offset(200, 75),
                    end: Offset(120, 130),
                  ),
                ),
                CustomPaint(
                  painter: RightLinePainter(
                    start: Offset(70, 285),
                    end: Offset(165, 285),
                  ),
                ),
                CustomPaint(
                  painter: RightLinePainter(
                    start: Offset(100, 285),
                    end: Offset(150, 230),
                  ),
                ),
                CustomPaint(
                  painter: RightLinePainter(
                    start: Offset(430, 160),
                    end: Offset(520, 160),
                  ),
                ),
                CustomPaint(
                  painter: RightLinePainter(
                    start: Offset(190, 170),
                    end: Offset(430, 160),
                  ),
                ),
                CustomPaint(
                  painter: RightLinePainter(
                    start: Offset(430, 220),
                    end: Offset(520, 220),
                  ),
                ),
                CustomPaint(
                  painter: RightLinePainter(
                    start: Offset(430, 220),
                    end: Offset(250, 220),
                  ),
                ),
                CustomPaint(
                  painter: RightLinePainter(
                    start: Offset(430, 280),
                    end: Offset(520, 280),
                  ),
                ),
                CustomPaint(
                  painter: RightLinePainter(
                    start: Offset(430, 280),
                    end: Offset(370, 255),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
