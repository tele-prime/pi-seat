import 'dart:ui';

import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/presentation/left/seat_touch_page/controllers/left_seat_touch_page_controller.dart';
import 'package:pichair/presentation/left/seat_touch_page/widgets/left_seat_touch_page_appbar.dart';
import 'package:pichair/presentation/left/seat_touch_page/widgets/left_seat_touch_page_button_control.dart';
import 'package:pichair/presentation/left/seat_touch_page/widgets/left_seat_touch_page_chair_info.dart';
import 'package:pichair/presentation/left/seat_touch_page/widgets/left_seat_touch_page_touch_control.dart';

class LeftSeatTouchPage extends StatelessWidget {
  const LeftSeatTouchPage({super.key});

  @override
  Widget build(BuildContext context) {
    double whSize = Get.height/10;
    return GetBuilder<LeftSeatTouchPageController>(builder: (controller) => NeumorphicTheme(
        themeMode: currentThemeMode.value,
        darkTheme: NeumorphicThemeData.dark(
            shadowLightColor: SssColor.grey.withAlpha(140)
        ),
        child: Scaffold(
      key: controller.leftScaffoldKey,
      body: Stack(
        children: [
          Positioned.fill(
            child: AspectRatio(
              aspectRatio: 1.66,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/seat_background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: controller.currentMovement == ChairMovement.none ? 0.0 : 1.0,
                      sigmaY: controller.currentMovement == ChairMovement.none ? 0.0 : 1.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white12.withAlpha(27)),
                  ),
                ),
              ),
            ),
          ),
          LeftSeatTouchPageChairInfo(),
          {
            0 : SizedBox(),
            1: LeftSeatTouchPageTouchControl(),
            2 : LeftSeatTouchPageButtonControl(),
          }[currentLayoutDesign.value]!,
          LeftSeatTouchPageAppbar(size: whSize),
        ],
      ),
    )));
  }
}