import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/right/control_button_page/controller/right_control_button_page_controller.dart';

class RightControlButtonImageWidget extends StatelessWidget {
  const RightControlButtonImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RightControlButtonPageController>(builder: (controller) => Transform.translate(
      offset: Offset(80.0, 40.0),
      child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double stackWidth = constraints.maxWidth;
            final double originalWidth = 3000;
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
                          child: Image.asset('assets/images/c0.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                            left: controller.c4x * scaleFactor,
                            top: controller.c4y * scaleFactor,
                            width: controller.c4w * scaleFactor,
                            height: controller.c4h * scaleFactor,
                            child: Image.asset('assets/images/c4.png',
                              fit: BoxFit.contain,
                              color: (controller.controllerChairMovement == ChairMovement.legDownward || controller.controllerChairMovement == ChairMovement.legUpward) ?
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
                              color: (controller.controllerChairMovement == ChairMovement.seatBackward || controller.controllerChairMovement == ChairMovement.seatForward) ?
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
                              color: (controller.controllerChairMovement == ChairMovement.backForward || controller.controllerChairMovement == ChairMovement.backBackward) ?
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
                              color: (controller.controllerChairMovement == ChairMovement.handDownward || controller.controllerChairMovement == ChairMovement.handUpward) ?
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
                              color: (controller.controllerChairMovement == ChairMovement.footForward || controller.controllerChairMovement == ChairMovement.footBackward) ?
                              SssColor.selectionRed : null,
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
