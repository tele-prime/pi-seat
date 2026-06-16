import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/presentation/right/control_touch_page/controllers/right_control_touch_page_controller.dart';
import 'package:pichair/presentation/right/control_touch_page/widgets/right_control_touch_page_appbar.dart';
import 'package:pichair/presentation/right/control_touch_page/widgets/right_control_touch_page_button_control.dart';
import 'package:pichair/presentation/right/control_touch_page/widgets/right_control_touch_page_chair_info.dart';
import 'package:pichair/presentation/right/control_touch_page/widgets/right_control_touch_page_touch_control.dart';

class RightControlTouchPage extends StatelessWidget {
  const RightControlTouchPage({super.key});

  @override
  Widget build(BuildContext context) {
    double whSize = Get.height/10;
    return GetBuilder<RightControlTouchPageController>(builder: (controller) => NeumorphicTheme(
        themeMode: currentThemeMode.value,
        darkTheme: NeumorphicThemeData.dark(
            shadowLightColor: SssColor.grey.withAlpha(140)
        ),
        child: Scaffold(
          key: controller.rightScaffoldKey,
          body: Stack(
            children: [
              // Image.asset(
              //   'assets/images/AirbusSeat.jpg',
              //   fit: BoxFit.cover,
              // ),
              RightControlTouchPageChairInfo(),
              {
                0 : SizedBox(),
                1: RightControlTouchPageTouchControl(),
                2 : RightControlTouchPageButtonControl(),
              }[currentLayoutDesign.value]!,
              RightControlTouchPageAppbar(size: whSize),
            ],
          ),
    )));
  }
}