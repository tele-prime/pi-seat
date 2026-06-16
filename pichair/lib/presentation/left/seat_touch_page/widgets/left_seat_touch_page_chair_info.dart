import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/left/seat_touch_page/controllers/left_seat_touch_page_controller.dart';
import 'package:pichair/presentation/left/seat_touch_page/widgets/left_seat_label_bubble.dart';
import 'package:pichair/presentation/left/seat_touch_page/widgets/left_seat_line_painter.dart';

class LeftSeatTouchPageChairInfo extends StatelessWidget {
  const LeftSeatTouchPageChairInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeftSeatTouchPageController>(builder: (controller) => LayoutBuilder(
      builder: (context, constraints) {
        final double stackWidth = constraints.maxWidth;
        final double originalWidth = controller.imgWidth;
        final double scaleFactor = stackWidth / originalWidth;
        return AspectRatio(
          aspectRatio: 1.66,
          child: Stack(
            children: [
              Positioned(
                  left: controller.c4x * scaleFactor,
                  top: controller.c4y * scaleFactor,
                  width: controller.c4w * scaleFactor,
                  height: controller.c4h * scaleFactor,
                  child: Image.asset('assets/images/sl.png',
                    fit: BoxFit.contain,
                    color: (controller.currentMovement == ChairMovement.legDownward || controller.currentMovement == ChairMovement.legUpward) ?
                    SssColor.selectionRed : null,
                  )
              ),
              Positioned(
                  left: controller.c3x * scaleFactor,
                  top: controller.c3y * scaleFactor,
                  width: controller.c3w * scaleFactor,
                  height: controller.c3h * scaleFactor,
                  child: Image.asset('assets/images/ss.png',
                    fit: BoxFit.contain,
                    color: (controller.currentMovement == ChairMovement.seatBackward || controller.currentMovement == ChairMovement.seatForward) ?
                    SssColor.selectionRed : null,
                  )
              ),
              Positioned(
                  left: controller.c1x * scaleFactor,
                  top: controller.c1y * scaleFactor,
                  width: controller.c1w * scaleFactor,
                  height: controller.c1h * scaleFactor,
                  child: Image.asset('assets/images/sb.png',
                    fit: BoxFit.contain,
                    color: (controller.currentMovement == ChairMovement.backForward || controller.currentMovement == ChairMovement.backBackward) ?
                    SssColor.selectionRed : null,
                  )
              ),
              Positioned(
                  left: controller.c2x * scaleFactor,
                  top: controller.c2y * scaleFactor,
                  width: controller.c2w * scaleFactor,
                  height: controller.c2h * scaleFactor,
                  child: Image.asset('assets/images/sa.png',
                    fit: BoxFit.contain,
                    color: (controller.currentMovement == ChairMovement.handDownward || controller.currentMovement == ChairMovement.handUpward) ?
                    SssColor.selectionRed : null,
                  )
              ),
              Positioned(
                  left: controller.c5x * scaleFactor,
                  top: controller.c5y * scaleFactor,
                  width: controller.c5w * scaleFactor,
                  height: controller.c5h * scaleFactor,
                  child: Image.asset('assets/images/sf.png',
                    fit: BoxFit.contain,
                    color: (controller.currentMovement == ChairMovement.footForward || controller.currentMovement == ChairMovement.footBackward) ?
                    SssColor.selectionRed : null,
                  )
              ),
              ...currentLabelAvailability.value ? <Widget>[
                Positioned(
                    left: 10,
                    top: 150,
                    width: controller.labelWidth,
                    height: controller.labelHeight,
                    child: LeftSeatLabelBubble(label: 'back'.tr,)
                ),
                Positioned(
                    left: 10,
                    bottom: 40,
                    width: controller.labelWidth,
                    height: controller.labelHeight,
                    child: LeftSeatLabelBubble(label: 'arm'.tr)
                ),
                Positioned(
                    right: 10,
                    top: 120,
                    width: controller.labelWidth,
                    height: controller.labelHeight,
                    child: LeftSeatLabelBubble(label: 'seat'.tr)
                ),
                Positioned(
                    right: 10,
                    top: 180,
                    width: controller.labelWidth,
                    height: controller.labelHeight,
                    child: LeftSeatLabelBubble(label: 'leg'.tr)
                ),
                Positioned(
                    right: 10,
                    top: 240,
                    width: controller.labelWidth,
                    height: controller.labelHeight,
                    child: LeftSeatLabelBubble(label: 'foot'.tr)
                ),
                CustomPaint(
                  painter: LeftSeatLinePainter(
                    start: Offset(110, 165),
                    end: Offset(130, 165),
                  ),
                ),
                CustomPaint(
                  painter: LeftSeatLinePainter(
                    start: Offset(130, 165),
                    end: Offset(210, 110),
                  ),
                ),
                CustomPaint(
                  painter: LeftSeatLinePainter(
                    start: Offset(110, 295),
                    end: Offset(130, 295),
                  ),
                ),
                CustomPaint(
                  painter: LeftSeatLinePainter(
                    start: Offset(130, 295),
                    end: Offset(160, 215),
                  ),
                ),
                CustomPaint(
                  painter: LeftSeatLinePainter(
                    start: Offset(460, 135),
                    end: Offset(475, 135),
                  ),
                ),
                CustomPaint(
                  painter: LeftSeatLinePainter(
                    start: Offset(275, 180),
                    end: Offset(460, 135),
                  ),
                ),
                CustomPaint(
                  painter: LeftSeatLinePainter(
                    start: Offset(460, 195),
                    end: Offset(475, 195),
                  ),
                ),
                CustomPaint(
                  painter: LeftSeatLinePainter(
                    start: Offset(300, 270),
                    end: Offset(460, 195),
                  ),
                ),
                CustomPaint(
                  painter: LeftSeatLinePainter(
                    start: Offset(460, 255),
                    end: Offset(475, 255),
                  ),
                ),
                CustomPaint(
                  painter: LeftSeatLinePainter(
                    start: Offset(435, 300),
                    end: Offset(460, 255),
                  ),
                ),
              ] : <Widget>[],
            ],
          ),
        );
      },
    ));
  }
}
