import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/left/seat_touch_page/controllers/left_seat_touch_page_controller.dart';

class LeftSeatTouchPageTouchControl extends StatelessWidget {
  const LeftSeatTouchPageTouchControl({super.key});

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
                              ChairMovement.backForward,
                              ChairMovement.backBackward
                          ),
                          // listener: (detail){
                          //   if(detail.x != 0 || detail.y != 0){
                          //     if(detail.x > 0) {
                          //       controller.startMovement(ChairMovement.backForward);
                          //     }else if(detail.x < 0) {
                          //       controller.startMovement(ChairMovement.backBackward);
                          //     }
                          //   }else{
                          //     controller.stopMovement();
                          //   }
                          //   controller.update();
                          // }
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
                            // listener: (detail){
                            //   if(detail.x != 0 || detail.y != 0){
                            //     if(detail.y > 0) {
                            //       controller.startMovement(ChairMovement.legDownward);
                            //     }else if(detail.y < 0) {
                            //       controller.startMovement(ChairMovement.legUpward);
                            //     }
                            //   }else{
                            //     controller.stopMovement();
                            //   }
                            //   controller.update();
                            // }
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
                              ChairMovement.seatForward,
                              ChairMovement.seatBackward
                          ),
                          // listener: (detail){
                          //   if(detail.x != 0 || detail.y != 0){
                          //     if(detail.x > 0) {
                          //       controller.startMovement(ChairMovement.seatForward);
                          //     }else if(detail.x < 0) {
                          //       controller.startMovement(ChairMovement.seatBackward);
                          //     }
                          //   }else{
                          //     controller.stopMovement();
                          //   }
                          //   controller.update();
                          // }
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
                          // listener: (detail){
                          //   if(detail.x != 0 || detail.y != 0){
                          //     if(detail.y > 0) {
                          //       controller.startMovement(ChairMovement.handDownward);
                          //     }else if(detail.y < 0) {
                          //       controller.startMovement(ChairMovement.handUpward);
                          //     }
                          //   }else{
                          //     controller.stopMovement();
                          //   }
                          //   controller.update();
                          // }
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
                              // child: Row(
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     Expanded(child: Center(
                              //       child: Image.asset(
                              //         'assets/images/arrow_left.png',
                              //         color: SssColor.arrowBlack,
                              //       ),
                              //     )),
                              //     Expanded(child: Center(
                              //       child: Image.asset(
                              //         'assets/images/arrow_right.png',
                              //         color: SssColor.arrowBlack,
                              //       ),
                              //     )),
                              //   ],
                              // ),
                              // child: RippleWave(
                              //   side: RippleSide.leftAndRight,
                              //   child: SizedBox()
                              // ),
                            ),
                            listener: (detail) => controller.touchControlX(
                                detail,
                                ChairMovement.footBackward,
                                ChairMovement.footForward
                            ),
                            // listener: (detail){
                            //   if(detail.x != 0 || detail.y != 0){
                            //     if(detail.x > 0) {
                            //       controller.startMovement(ChairMovement.footBackward);
                            //     }else if(detail.x < 0) {
                            //       controller.startMovement(ChairMovement.footForward);
                            //     }
                            //   }else{
                            //     controller.stopMovement();
                            //   }
                            //   controller.update();
                            // }
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
