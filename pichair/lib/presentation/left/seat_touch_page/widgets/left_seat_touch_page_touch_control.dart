import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/left/seat_touch_page/controllers/left_seat_touch_page_controller.dart';

class LeftSeatTouchPageTouchControl extends StatefulWidget {
  const LeftSeatTouchPageTouchControl({super.key});

  @override
  State<LeftSeatTouchPageTouchControl> createState() => _LeftSeatTouchPageTouchControlState();
}

class _LeftSeatTouchPageTouchControlState extends State<LeftSeatTouchPageTouchControl> with TickerProviderStateMixin {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeftSeatTouchPageController>(builder: (controller) => Center(
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
                      left: controller.c1x * scaleFactor,
                      top: (controller.c1y * scaleFactor) - 50,
                      width: (controller.c1w * scaleFactor),
                      height: (controller.c1h * scaleFactor),
                      child: Joystick(
                          stick: CircleAvatar(
                            radius: controller.joyStickTouch,
                            backgroundColor: Colors.red.withAlpha(1),
                            child: CircleAvatar(
                              radius: controller.joyStickDot,
                              backgroundColor: Colors.white,
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
                            // child: Expanded(child: Center(
                            //   child: SizedBox(
                            //       height: controller.arrowSize,
                            //       child: Lottie.asset(
                            //         controller.arrowAssetName,
                            //       )
                            //   ),
                            // )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: Center(
                                  child: RotatedBox(
                                    quarterTurns: controller.turnDown,
                                    child: SizedBox(
                                        height: controller.arrowSize,
                                        child: Opacity(
                                          opacity: 1,
                                          child: Lottie.asset(
                                            "assets/lottie/white_dot.json",
                                          )
                                        )
                                    ),
                                  ),
                                )),
                                Expanded(child: Center(
                                  child: RotatedBox(
                                    quarterTurns: controller.turnUp,
                                    child: SizedBox(
                                        height: controller.arrowSize,
                                        child: Opacity(
                                          opacity: 1,
                                          child: Lottie.asset(
                                            "assets/lottie/white_dot.json",
                                          ),
                                        )
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                          listener: (detail) => controller.touchControlX(
                              detail,
                              ChairMovement.backForward,
                              ChairMovement.backBackward
                          ),
                      )
                  ),
                  Positioned(
                      left: controller.c4x * scaleFactor,
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
                              // child: Expanded(child: Center(
                              //   child: RotatedBox(
                              //     quarterTurns: controller.turnLeft,
                              //     child: SizedBox(
                              //         height: controller.arrowSize,
                              //         child: Lottie.asset(
                              //           "assets/lottie/arrow_white.json",
                              //         )
                              //     ),
                              //   ),
                              // )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(child: Center(
                                    child: RotatedBox(
                                      quarterTurns: controller.turnUp,
                                      child: SizedBox(
                                          height: controller.arrowSize,
                                          child: Opacity(
                                              opacity: controller.arrowOpacity,
                                              child: Lottie.asset(
                                                controller.arrowAssetName,
                                              )
                                          )
                                      ),
                                    ),
                                  )),
                                  Expanded(child: Center(
                                    child: RotatedBox(
                                      quarterTurns: controller.turnDown,
                                      child: SizedBox(
                                          height: controller.arrowSize,
                                          child: Opacity(
                                            opacity: controller.arrowOpacity,
                                            child: Lottie.asset(
                                              controller.arrowAssetName,
                                            ),
                                          )
                                      ),
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
                      left: controller.c3x * scaleFactor,
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
                            // child: Expanded(child: Center(
                            //   child: SizedBox(
                            //       height: controller.arrowSize,
                            //       child: Lottie.asset(
                            //         'assets/lottie/arrow2side.json',
                            //       )
                            //   ),
                            // )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: Center(
                                  child: RotatedBox(
                                    quarterTurns: controller.turnRight,
                                    child: SizedBox(
                                        height: controller.arrowSize,
                                        child: Opacity(
                                            opacity: controller.arrowOpacity,
                                            child: Lottie.asset(
                                              controller.arrowAssetName,
                                            )
                                        )
                                    ),
                                  ),
                                )),
                                Expanded(child: Center(
                                  child: RotatedBox(
                                    quarterTurns: controller.turnLeft,
                                    child: SizedBox(
                                        height: controller.arrowSize,
                                        child: Opacity(
                                          opacity: controller.arrowOpacity,
                                          child: Lottie.asset(
                                            controller.arrowAssetName,
                                          ),
                                        )
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                          listener: (detail) => controller.touchControlX(
                              detail,
                              ChairMovement.seatForward,
                              ChairMovement.seatBackward
                          ),
                      )
                  ),
                  Positioned(
                      left: controller.c2x * scaleFactor,
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
                            // child: Expanded(child: Center(
                            //   child: RotatedBox(
                            //     quarterTurns: controller.turnLeft,
                            //     child: SizedBox(
                            //         height: controller.arrowSize,
                            //         child: Lottie.asset(
                            //           'assets/lottie/arrow2side.json',
                            //         )
                            //     ),
                            //   ),
                            // )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: Center(
                                  child: RotatedBox(
                                    quarterTurns: controller.turnUp,
                                    child: SizedBox(
                                        height: controller.arrowSize,
                                        child: Opacity(
                                            opacity: controller.arrowOpacity,
                                            child: Lottie.asset(
                                              controller.arrowAssetName,
                                            )
                                        )
                                    ),
                                  ),
                                )),
                                Expanded(child: Center(
                                  child: RotatedBox(
                                    quarterTurns: controller.turnDown,
                                    child: SizedBox(
                                        height: controller.arrowSize,
                                        child: Opacity(
                                          opacity: controller.arrowOpacity,
                                          child: Lottie.asset(
                                            controller.arrowAssetName,
                                          ),
                                        )
                                    ),
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
                      left: (controller.c5x * scaleFactor),
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
                              // child: Expanded(child: Center(
                              //   child: SizedBox(
                              //       height: controller.arrowSize,
                              //       child: Lottie.asset(
                              //         'assets/lottie/arrow2side.json',
                              //       )
                              //   ),
                              // )),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: RotatedBox(
                                    quarterTurns: controller.turnRight,
                                    child: SizedBox(
                                        height: controller.arrowSize,
                                        child: Opacity(
                                            opacity: controller.arrowOpacity,
                                            child: Lottie.asset(
                                              controller.arrowAssetName,
                                            )
                                        )
                                    ),
                                  ),),
                                  Expanded(child: SizedBox()),
                                  Center(
                                  child: RotatedBox(
                                    quarterTurns: controller.turnLeft,
                                    child: SizedBox(
                                        height: controller.arrowSize,
                                        child: Opacity(
                                          opacity: controller.arrowOpacity,
                                          child: Lottie.asset(
                                            controller.arrowAssetName,
                                          ),
                                        )
                                    ),
                                  ),
                                                                    ),
                                ],
                              ),
                            ),
                            listener: (detail) => controller.touchControlX(
                                detail,
                                ChairMovement.footBackward,
                                ChairMovement.footForward
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
