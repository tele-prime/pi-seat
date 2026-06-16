import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/right/seat_touch_page/controllers/right_seat_touch_page_controller.dart';

class RightSeatTouchPageTouchControl extends StatelessWidget {
  const RightSeatTouchPageTouchControl({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RightSeatTouchPageController>(builder: (controller) => Center(
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
                  Positioned(
                      left: stackWidth - (controller.c1x * scaleFactor) - (controller.c1w * scaleFactor),
                      top: (controller.c1y * scaleFactor) - 50,
                      width: (controller.c1w * scaleFactor),
                      height: (controller.c1h * scaleFactor),
                      child: Joystick(
                          stick: CircleAvatar(
                            radius: controller.joyStickTouch,
                            backgroundColor: Colors.red.withAlpha(1),
                            child: CircleAvatar(
                              radius: controller.joyStickDot,
                              backgroundColor: Colors.red,
                            ),
                          ),
                          mode: JoystickMode.horizontal,
                          base: Container(
                            width: 200,
                            height: 200,
                            decoration: const BoxDecoration(
                              color: SssColor.joystickBackground,
                              shape: BoxShape.circle,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: Center(
                                  child: Icon(Icons.keyboard_arrow_left_outlined,
                                    color: SssColor.arrowBlack,
                                    size: 20,
                                  ),
                                )),
                                Expanded(child: Center(
                                  child: Icon(Icons.keyboard_arrow_right_outlined,
                                    color: SssColor.arrowBlack,
                                    size: 20,
                                  ),
                                )),
                              ],
                            ),
                          ),
                          listener: (detail) => controller.touchControlX(
                              detail,
                              ChairMovement.backBackward,
                              ChairMovement.backForward
                          ),
                      )
                  ),
                  Positioned(
                      left: stackWidth - (controller.c4x * scaleFactor) - (controller.c4w * scaleFactor),
                      top: (controller.c4y * scaleFactor) - 30,
                      width: controller.c4w * scaleFactor,
                      height: controller.c4h * scaleFactor,
                      child: Center(
                        child: Joystick(
                            stick: CircleAvatar(
                              radius: controller.joyStickTouch,
                              backgroundColor: Colors.red.withAlpha(1),
                              child: CircleAvatar(
                                radius: controller.joyStickDot,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            mode: JoystickMode.vertical,
                            base: Container(
                              width: 200,
                              height: 200,
                              decoration: const BoxDecoration(
                                color: SssColor.joystickBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(child: Center(
                                    child: Icon(Icons.keyboard_arrow_up_outlined,
                                      color: SssColor.arrowBlack,
                                      size: 20,
                                    ),
                                  )),
                                  Expanded(child: Center(
                                    child: Icon(Icons.keyboard_arrow_down_outlined,
                                      color: SssColor.arrowBlack,
                                      size: 20,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            listener: (detail) => controller.touchControlY(
                                detail,
                                ChairMovement.legDownward,
                                ChairMovement.legUpward
                            ),
                        ),
                      )
                  ),
                  Positioned(
                      left: stackWidth - (controller.c3x * scaleFactor) - (controller.c3w * scaleFactor),
                      top: (controller.c3y * scaleFactor) - 60,
                      width: controller.c3w * scaleFactor,
                      height: controller.c3h * scaleFactor,
                      child: Joystick(
                          stick: CircleAvatar(
                            radius: controller.joyStickTouch,
                            backgroundColor: Colors.red.withAlpha(1),
                            child: CircleAvatar(
                              radius: controller.joyStickDot,
                              backgroundColor: Colors.red,
                            ),
                          ),
                          mode: JoystickMode.horizontal,
                          base: Container(
                            width: 200,
                            height: 200,
                            decoration: const BoxDecoration(
                              color: SssColor.joystickBackground,
                              shape: BoxShape.circle,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: Center(
                                  child: Icon(Icons.keyboard_arrow_left_outlined,
                                    color: SssColor.arrowBlack,
                                    size: 20,
                                  ),
                                )),
                                Expanded(child: Center(
                                  child: Icon(Icons.keyboard_arrow_right_outlined,
                                    color: SssColor.arrowBlack,
                                    size: 20,
                                  ),
                                )),
                              ],
                            ),
                          ),
                          listener: (detail) => controller.touchControlX(
                              detail,
                              ChairMovement.seatBackward,
                              ChairMovement.seatForward
                          ),
                      )
                  ),
                  Positioned(
                      left: stackWidth - (controller.c2x * scaleFactor) - ((controller.c2w * scaleFactor) - 120),
                      top: (controller.c2y * scaleFactor) - 30,
                      width: (controller.c2w * scaleFactor) - 120,
                      height: controller.c2h * scaleFactor,
                      child: Joystick(
                          stick: CircleAvatar(
                            radius: controller.joyStickTouch,
                            backgroundColor: Colors.red.withAlpha(1),
                            child: CircleAvatar(
                              radius: controller.joyStickDot,
                              backgroundColor: Colors.red,
                            ),
                          ),
                          mode: JoystickMode.vertical,
                          base: Container(
                            width: 200,
                            height: 200,
                            decoration: const BoxDecoration(
                              color: SssColor.joystickBackground,
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: Center(
                                  child: Icon(Icons.keyboard_arrow_up_outlined,
                                    color: SssColor.arrowBlack,
                                    size: 20,
                                  ),
                                )),
                                Expanded(child: Center(
                                  child: Icon(Icons.keyboard_arrow_down_outlined,
                                    color: SssColor.arrowBlack,
                                    size: 20,
                                  ),
                                )),
                              ],
                            ),
                          ),
                          listener: (detail) => controller.touchControlY(
                              detail,
                              ChairMovement.handDownward,
                              ChairMovement.handUpward
                          ),
                      )
                  ),
                  Positioned(
                      left: stackWidth - (controller.c5x * scaleFactor) - ((controller.c5w * scaleFactor) + 20),
                      top: (controller.c5y * scaleFactor) - 30,
                      width: (controller.c5w * scaleFactor) + 20,
                      height: controller.c5h * scaleFactor,
                      child: Center(
                        child: Joystick(
                            stick: CircleAvatar(
                              radius: controller.joyStickTouch,
                              backgroundColor: Colors.red.withAlpha(1),
                              child: CircleAvatar(
                                radius: controller.joyStickDot,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            mode: JoystickMode.horizontal,
                            base: Container(
                              width: 200,
                              height: 200,
                              decoration: const BoxDecoration(
                                color: SssColor.joystickBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(child: Center(
                                    child: Icon(Icons.keyboard_arrow_left_outlined,
                                      color: SssColor.arrowBlack,
                                      size: 20,
                                    ),
                                  )),
                                  Expanded(child: Center(
                                    child: Icon(Icons.keyboard_arrow_right_outlined,
                                      color: SssColor.arrowBlack,
                                      size: 20,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            listener: (detail) => controller.touchControlX(
                                detail,
                                ChairMovement.footForward,
                                ChairMovement.footBackward
                            ),
                        ),
                      )
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ));
  }
}
