import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/left/seat_touch_page/controllers/left_seat_touch_page_controller.dart';

class LeftSeatTouchPageButtonControl extends StatelessWidget {
  const LeftSeatTouchPageButtonControl({super.key});

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
              const double originalWidth = 3000.0;
              final double scaleFactor = stackWidth / originalWidth;
              return Stack(
                children: [
                  Positioned(
                      left: (controller.c5x * scaleFactor) - 10,
                      top: controller.c5y * scaleFactor,
                      width: (controller.c5w * scaleFactor) + 20,
                      height: controller.c5h * scaleFactor,
                      child:  Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Center(
                            child: GestureDetector(
                              onTapDown: (detail){
                                controller.startMovement(ChairMovement.footForward);
                              },
                              onTapCancel: (){
                                controller.stopMovement();
                              },
                              child: IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.arrow_back_ios,
                                  size: 30,
                                  color: SssColor.arrowBlack,
                                ),
                              ),
                            ),
                          )),
                          Expanded(child: Center(
                            child: GestureDetector(
                              onTapDown: (detail){
                                controller.startMovement(ChairMovement.footBackward);
                              },
                              onTapCancel: (){
                                controller.stopMovement();
                              },
                              child: IconButton(
                                padding: const EdgeInsets.only(right: 10),
                                icon: Icon(Icons.arrow_forward_ios,
                                  size: 30,
                                  color: SssColor.arrowBlack,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          )),
                        ],
                      ),
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
