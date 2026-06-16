import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/right/control_touch_page/controllers/right_control_touch_page_controller.dart';
import 'package:pichair/presentation/right/control_touch_page/widgets/right_label_bubble.dart';
import 'package:pichair/presentation/right/control_touch_page/widgets/right_line_painter.dart';

class RightControlTouchPageChairInfo extends StatelessWidget {
  const RightControlTouchPageChairInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RightControlTouchPageController>(builder: (controller) => Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AspectRatio(
          aspectRatio: 2,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double stackWidth = constraints.maxWidth;
              final double originalWidth = controller.imgWidth;
              final double scaleFactor = stackWidth / originalWidth;
              return Stack(
                children: [
                  Positioned.fill(
                    child: Transform.flip(
                      flipX: true,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            width: controller.imgWidth * scaleFactor,
                            height: controller.imgHeight * scaleFactor,
                            child: GestureDetector(
                              onTap: () => Get.log('#### chair 0 flipped ####'),
                              child: Image.asset('assets/images/c0.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                              left: controller.c4x * scaleFactor,
                              top: controller.c4y * scaleFactor,
                              width: controller.c4w * scaleFactor,
                              height: controller.c4h * scaleFactor,
                              child: Image.asset('assets/images/c4.png',
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
                              child: Image.asset('assets/images/c3.png',
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
                              child: Image.asset('assets/images/c1.png',
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
                              child: Image.asset('assets/images/c2.png',
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
                              child: Image.asset('assets/images/c5.png',
                                fit: BoxFit.contain,
                                color: (controller.currentMovement == ChairMovement.footForward || controller.currentMovement == ChairMovement.footBackward) ?
                                SssColor.selectionRed : null,
                              )
                          ),
                          // Lines (hard-coded coordinates flip automatically with the layer)
                          CustomPaint(
                            painter: RightLinePainter(
                              start: Offset(110, 54),
                              end: Offset(130, 54),
                            ),
                          ),
                          CustomPaint(
                            painter: RightLinePainter(
                              start: Offset(130, 54),
                              end: Offset(160, 80),
                            ),
                          ),
                          CustomPaint(
                            painter: RightLinePainter(
                              start: Offset(110, 237),
                              end: Offset(130, 237),
                            ),
                          ),
                          CustomPaint(
                            painter: RightLinePainter(
                              start: Offset(130, 237),
                              end: Offset(205, 188),
                            ),
                          ),
                          CustomPaint(
                            painter: RightLinePainter(
                              start: Offset(460, 65),
                              end: Offset(475, 65),
                            ),
                          ),
                          CustomPaint(
                            painter: RightLinePainter(
                              start: Offset(262, 138),
                              end: Offset(460, 65),
                            ),
                          ),
                          CustomPaint(
                            painter: RightLinePainter(
                              start: Offset(460, 125),
                              end: Offset(475, 125),
                            ),
                          ),
                          CustomPaint(
                            painter: RightLinePainter(
                              start: Offset(312, 177),
                              end: Offset(460, 125),
                            ),
                          ),
                          CustomPaint(
                            painter: RightLinePainter(
                              start: Offset(460, 185),
                              end: Offset(475, 185),
                            ),
                          ),
                          CustomPaint(
                            painter: RightLinePainter(
                              start: Offset(410, 210),
                              end: Offset(460, 185),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ── Layer 2: Unflipped labels at mirrored positions ──
                  if (currentLabelAvailability.value) ...[
                    Positioned(
                        right: 10,
                        top: 40,
                        width: controller.labelWidth,
                        height: controller.labelHeight,
                        child: RightLabelBubble(label: 'back'.tr,)
                    ),
                    Positioned(
                        right: 10,
                        bottom: 40,
                        width: controller.labelWidth,
                        height: controller.labelHeight,
                        child: RightLabelBubble(label: 'arm'.tr)
                    ),
                    Positioned(
                        left: 10,
                        top: 50,
                        width: controller.labelWidth,
                        height: controller.labelHeight,
                        child: RightLabelBubble(label: 'seat'.tr)
                    ),
                    Positioned(
                        left: 10,
                        top: 110,
                        width: controller.labelWidth,
                        height: controller.labelHeight,
                        child: RightLabelBubble(label: 'leg'.tr)
                    ),
                    Positioned(
                        left: 10,
                        top: 170,
                        width: controller.labelWidth,
                        height: controller.labelHeight,
                        child: RightLabelBubble(label: 'foot'.tr)
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    ));
  }
}
