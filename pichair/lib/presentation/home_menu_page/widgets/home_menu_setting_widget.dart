import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/routes/app_routes.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';

class HomeMenuSettingWidget extends StatelessWidget {
  const HomeMenuSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SizedBox()),
        // NeumorphicButton(
        //   onPressed: () => Get.toNamed(AppRoutes.userManual),
        //   style: SssStyleTheme().getMenu(radius: 10),
        //   padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        //   child: Center(
        //     child: SizedBox(
        //       width: 50,
        //       height: 50,
        //       child: Icon(Icons.book_outlined, color: Get.theme.cardColor, size: 20),
        //     ),
        //   ),
        // ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.settingShow),
          // onTapUp: (a) => Get.toNamed(AppRoutes.settingShow),
          // onTapDown: (a) => Get.toNamed(AppRoutes.settingShow),
          onLongPress: () => Get.toNamed(AppRoutes.setting),
          child: Neumorphic(
            style: SssStyleTheme().getMenu(radius: 10),
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              child: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.settings, color: Get.theme.cardColor, size: 20),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 50)
      ],
    );
  }
}
