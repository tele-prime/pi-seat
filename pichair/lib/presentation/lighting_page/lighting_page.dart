import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/lighting_page/controller/lighting_page_controller.dart';
import 'package:pichair/presentation/lighting_page/widgets/light_page_appbar.dart';
import 'package:pichair/presentation/lighting_page/widgets/lights_widget.dart';

class LightingPage extends StatelessWidget {
  const LightingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LightingPageController>(builder: (controller) => NeumorphicTheme(
        themeMode: currentThemeMode.value,
        darkTheme: NeumorphicThemeData.dark(
            shadowLightColor: SssColor.grey.withAlpha(140)
        ),
        child: Scaffold(
          body: Stack(
            children: [
              LightsWidget(),
              LightPageAppbar()
            ],
          ),
        )
    ));
  }
}
