import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_android_controller.dart';

class TvMenus extends StatelessWidget {
  const TvMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TvPageAndroidController>(builder: (controller) => Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: 50,
        height: Get.height,
        child: Column(
          children: [
            NeumorphicButton(
              onPressed: () => Get.back(),
              style: SssStyleTheme().getMenu(radius: 10),
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              child: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.home, size: 20),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTapDown: (_) {
                controller.openSettings();
              },
              onTapCancel: controller.tapUpTvButton,
              child: NeumorphicButton(
                onPressed: (){},
                style: SssStyleTheme().getMenu(radius: 10),
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                child: Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.settings,
                        size: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTapDown: (_) {
                controller.tapDownTvButton();
              },
              onTapCancel: controller.tapUpTvButton,
              child: NeumorphicButton(
                onPressed: (){},
                style: SssStyleTheme().getMenu(radius: 10),
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                child: Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: GlowIcon(Icons.power_settings_new,
                      size: 20,
                      color: SssColor.red,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            NeumorphicButton(
              onPressed: () => controller.changeLayout(TvLayout.remote),
              style: SssStyleTheme().getMenu(radius: 10),
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              child: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: controller.currentLayout == TvLayout.remote ? GlowIcon(Icons.settings_remote,
                      size: 20,
                      color: SssColor.yellow
                  ) : Icon(Icons.settings_remote, size: 20),
                ),
              ),
            ),
            SizedBox(height: 10),
            NeumorphicButton(
              onPressed: () => controller.changeLayout(TvLayout.keyboard),
              style: SssStyleTheme().getMenu(radius: 10),
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              child: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: controller.currentLayout == TvLayout.keyboard ? GlowIcon(Icons.keyboard,
                      size: 20,
                      color: SssColor.yellow
                  ) : Icon(Icons.keyboard, size: 20),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    ),);
  }
}
