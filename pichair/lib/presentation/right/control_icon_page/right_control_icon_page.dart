import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/right/control_icon_page/controller/right_control_icon_page_controller.dart';
import 'package:pichair/presentation/right/control_icon_page/widgets/right_control_icon_appbar.dart';
import 'package:pichair/presentation/right/control_icon_page/widgets/right_control_icon_list.dart';

class RightControlIconPage extends StatelessWidget {
  const RightControlIconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RightControlIconPageController>(builder: (controller) => NeumorphicTheme(
      themeMode: currentThemeMode.value,
      darkTheme: NeumorphicThemeData.dark(
          shadowLightColor: SssColor.grey.withAlpha(140)
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // Image.asset(
            //   'assets/images/AirbusSeat.jpg',
            //   fit: BoxFit.cover,
            // ),
            RightControlIconList(),
            RightControlIconAppbar(),
          ],
        ),
      )
    ));
  }
}
