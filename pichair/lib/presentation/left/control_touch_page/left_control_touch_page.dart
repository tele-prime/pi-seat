import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/presentation/left/control_touch_page/controllers/left_control_touch_page_controller.dart';
import 'package:pichair/presentation/left/control_touch_page/widgets/left_control_touch_page_appbar.dart';
import 'package:pichair/presentation/left/control_touch_page/widgets/left_control_touch_page_button_control.dart';
import 'package:pichair/presentation/left/control_touch_page/widgets/left_control_touch_page_chair_info.dart';
import 'package:pichair/presentation/left/control_touch_page/widgets/left_control_touch_page_touch_control.dart';

class LeftControlTouchPage extends StatelessWidget {
  const LeftControlTouchPage({super.key});

  @override
  Widget build(BuildContext context) {
    double whSize = Get.height/10;
    return GetBuilder<LeftControlTouchPageController>(builder: (controller) => NeumorphicTheme(
        themeMode: currentThemeMode.value,
        darkTheme: NeumorphicThemeData.dark(
            shadowLightColor: SssColor.grey.withAlpha(140)
        ),
        child: Scaffold(
      key: controller.leftScaffoldKey,
      // endDrawer: MenuPageEndDrawer(),
      body: Stack(
        children: [
          // ClipRect(
          //   child: Align(
          //     alignment: Alignment(-0.5, 0.0),
          //     child: Transform.flip(
          //         flipX: true,
          //         child: Image.asset('assets/images/seat_background.png', fit: BoxFit.cover,)
          //     ),
          //   ),
          // ),
          LeftControlTouchPageChairInfo(),
          {
            0 : SizedBox(),
            1: LeftControlTouchPageTouchControl(),
            2 : LeftControlTouchPageButtonControl(),
          }[currentLayoutDesign.value]!,
          LeftControlTouchPageAppbar(size: whSize),
        ],
      ),
    )));
  }
}