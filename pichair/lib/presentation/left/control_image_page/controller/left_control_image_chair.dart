import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/left/control_image_page/controller/left_control_image_page_controller.dart';

class LeftControlImageChair extends StatelessWidget {
  const LeftControlImageChair({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeftControlImagePageController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Align(
          alignment: Alignment.centerRight,
          heightFactor: 0.9,
          widthFactor: 0.8,
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
                    Positioned(
                      left: 0,
                      top: 0,
                      width: controller.imgWidth * scaleFactor,
                      height: controller.imgHeight * scaleFactor,
                      child: Image.asset(
                        'assets/images/c0.png',
                        fit: BoxFit.contain,
                        // color: (controller.currentSelected == null) ? null : Colors.black12,
                      ),
                    ),
                    Positioned(
                      left: controller.c4x * scaleFactor,
                      top: controller.c4y * scaleFactor,
                      width: controller.c4w * scaleFactor,
                      height: controller.c4h * scaleFactor,
                      child: Image.asset(
                        'assets/images/c4.png',
                        fit: BoxFit.contain,
                        color:
                        (controller.currentImage == ChairImage.leg)
                            ? SssColor.selectionRed
                            : null,
                      ),
                    ),
                    Positioned(
                      left: controller.c3x * scaleFactor,
                      top: controller.c3y * scaleFactor,
                      width: controller.c3w * scaleFactor,
                      height: controller.c3h * scaleFactor,
                      child: Image.asset(
                        'assets/images/c3.png',
                        fit: BoxFit.contain,
                        color: (controller.currentImage == ChairImage.seat) ? SssColor.selectionRed : null,
                      ),
                    ),
                    Positioned(
                      left: controller.c1x * scaleFactor,
                      top: controller.c1y * scaleFactor,
                      width: controller.c1w * scaleFactor,
                      height: controller.c1h * scaleFactor,
                      child: Image.asset(
                        'assets/images/c1.png',
                        fit: BoxFit.contain,
                        color:
                        (controller.currentImage == ChairImage.back)
                            ? SssColor.selectionRed
                            : null,
                      ),
                    ),
                    Positioned(
                      left: controller.c2x * scaleFactor,
                      top: controller.c2y * scaleFactor,
                      width: controller.c2w * scaleFactor,
                      height: controller.c2h * scaleFactor,
                      child: Image.asset(
                        'assets/images/c2.png',
                        fit: BoxFit.contain,
                        color:
                        (controller.currentImage == ChairImage.hand)
                            ? SssColor.selectionRed
                            : null,
                      ),
                    ),
                    Positioned(
                      left: controller.c5x * scaleFactor,
                      top: controller.c5y * scaleFactor,
                      width: controller.c5w * scaleFactor,
                      height: controller.c5h * scaleFactor,
                      child: Image.asset(
                        'assets/images/c5.png',
                        fit: BoxFit.contain,
                        color:
                        (controller.currentImage == ChairImage.foot)
                            ? SssColor.selectionRed
                            : null,
                      ),
                    ),
                    //------
                    Positioned(
                      left: (controller.c4x * scaleFactor) + ((controller.c4w * scaleFactor) / 2) - controller.circleRadius,
                      top: (controller.c4y * scaleFactor) + ((controller.c4h * scaleFactor) / 2) - controller.circleRadius,
                      width: controller.circleRadius * 2,
                      height: controller.circleRadius * 2,
                      child: GestureDetector(
                        onTap: () {
                          if (controller.currentImage == ChairImage.leg) {
                            controller.currentImage = ChairImage.none;
                            controller.update();
                          } else {
                            controller.currentImage = ChairImage.leg;
                            controller.update();
                          }
                        },
                        child: CircleAvatar(
                          radius: controller.circleRadius,
                          child: Text('4'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: (controller.c3x * scaleFactor) + ((controller.c3w * scaleFactor) / 2) - controller.circleRadius,
                      top: (controller.c3y * scaleFactor) + ((controller.c3h * scaleFactor) / 2) - controller.circleRadius,
                      width: controller.circleRadius * 2,
                      height: controller.circleRadius * 2,
                      child: GestureDetector(
                        onTap: () {
                          if (controller.currentImage == ChairImage.seat) {
                            controller.currentImage = ChairImage.none;
                            controller.update();
                          } else {
                            controller.currentImage = ChairImage.seat;
                            controller.update();
                          }
                        },
                        child: CircleAvatar(
                          radius: controller.circleRadius,
                          child: Text('3'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: (controller.c1x * scaleFactor) + ((controller.c1w * scaleFactor) / 2) - controller.circleRadius,
                      top: (controller.c1y * scaleFactor) + ((controller.c1h * scaleFactor / 2)),
                      width: controller.circleRadius * 2,
                      height: controller.circleRadius * 2,
                      child: GestureDetector(
                        onTap: () {
                          if (controller.currentImage == ChairImage.back) {
                            controller.currentImage = ChairImage.none;
                            controller.update();
                          } else {
                            controller.currentImage = ChairImage.back;
                            controller.update();
                          }
                        },
                        child: CircleAvatar(
                          radius: controller.circleRadius,
                          child: Text('1'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: (controller.c2x * scaleFactor) + ((controller.c2w * scaleFactor) / 2) - controller.circleRadius,
                      top: (controller.c2y * scaleFactor) + ((controller.c2h * scaleFactor) / 2),
                      width: controller.circleRadius * 2,
                      height: controller.circleRadius * 2,
                      child: GestureDetector(
                        onTap: () {
                          if (controller.currentImage == ChairImage.hand) {
                            controller.currentImage = ChairImage.none;
                            controller.update();
                          } else {
                            controller.currentImage = ChairImage.hand;
                            controller.update();
                          }
                        },
                        child: CircleAvatar(
                          radius: controller.circleRadius,
                          child: Text('2'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: (controller.c5x * scaleFactor) + ((controller.c5w * scaleFactor) / 2) - controller.circleRadius,
                      top: (controller.c5y * scaleFactor) + ((controller.c5h * scaleFactor) / 2) - controller.circleRadius,
                      width: controller.circleRadius * 2,
                      height: controller.circleRadius * 2,
                      child: GestureDetector(
                        onTap: () {
                          if (controller.currentImage == ChairImage.foot) {
                            controller.currentImage = ChairImage.none;
                            controller.update();
                          } else {
                            controller.currentImage = ChairImage.foot;
                            controller.update();
                          }
                        },
                        child: CircleAvatar(
                          radius: controller.circleRadius,
                          child: Text('5'),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // child: Image.asset(
          //   'assets/images/c0.png',
          //   fit: BoxFit.cover,
          //   width: Get.width,
          //   height: Get.height,
          // ),
        ),
      ),
    );
  }
}
