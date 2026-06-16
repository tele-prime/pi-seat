import 'dart:ui';

import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/presentation/right/seat_touch_page/controllers/right_seat_touch_page_controller.dart';
import 'package:pichair/presentation/right/seat_touch_page/widgets/right_seat_touch_page_appbar.dart';
import 'package:pichair/presentation/right/seat_touch_page/widgets/right_seat_touch_page_button_control.dart';
import 'package:pichair/presentation/right/seat_touch_page/widgets/right_seat_touch_page_chair_info.dart';
import 'package:pichair/presentation/right/seat_touch_page/widgets/right_seat_touch_page_touch_control.dart';

class RightSeatTouchPage extends StatelessWidget {
  const RightSeatTouchPage({super.key});

  @override
  Widget build(BuildContext context) {
    double whSize = Get.height/10;
    return GetBuilder<RightSeatTouchPageController>(builder: (controller) => NeumorphicTheme(
        themeMode: currentThemeMode.value,
        darkTheme: NeumorphicThemeData.dark(
            shadowLightColor: SssColor.grey.withAlpha(140)
        ),
        child: Scaffold(
      key: controller.rightScaffoldKey,
      body: Stack(
        children: [
          Positioned.fill(
            child: AspectRatio(
              aspectRatio: 1.66,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Transform.flip(
                    flipX: true,
                    child: const Image(
                      image: ExactAssetImage('assets/images/seat_background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Unchanged blur overlay
                  BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: controller.currentMovement == ChairMovement.none ? 0.0 : 1.0,
                        sigmaY: controller.currentMovement == ChairMovement.none ? 0.0 : 1.0
                    ),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white12.withAlpha(27)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          RightSeatTouchPageChairInfo(),
          {
            0 : SizedBox(),
            1: RightSeatTouchPageTouchControl(),
            2 : RightSeatTouchPageButtonControl(),
          }[currentLayoutDesign.value]!,
          RightSeatTouchPageAppbar(size: whSize),
        ],
      ),
    )));
  }
}