import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/setting_page/controller/setting_page_controller.dart';
import 'package:pichair/presentation/setting_page/layouts/setting_config_layout.dart';
import 'package:pichair/presentation/setting_page/layouts/setting_info_layout.dart';
import 'package:pichair/presentation/setting_page/layouts/setting_theme_layout.dart';
import 'package:pichair/presentation/setting_page/widgets/setting_menu_label_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPageController>(builder: (controller) => NeumorphicTheme(
      themeMode: currentThemeMode.value,
      darkTheme: NeumorphicThemeData.dark(
        shadowLightColor: SssColor.grey.withAlpha(140),
        intensity: 1,
        depth: 2,
      ),
      child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: controller.menuWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: NeumorphicButton(
                        onPressed: () => Get.back(),
                        style: SssStyleTheme().getMenu(radius: Get.height/40),
                        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                        child: Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.home, size: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    SettingMenuLabelWidget(
                      label: "setting_menu_config".tr,
                      value: 1,
                      group: controller.menuIndex,
                      width: controller.menuWidth,
                      onChanged: controller.changeMenuIndex,
                    ),
                    SizedBox(height: 12),
                    SettingMenuLabelWidget(
                      label: "setting_menu_layout".tr,
                      value: 2,
                      group: controller.menuIndex,
                      width: controller.menuWidth,
                      onChanged: controller.changeMenuIndex,
                    ),
                    SizedBox(height: 12),
                    SettingMenuLabelWidget(
                      label: "setting_menu_info".tr,
                      value: 3,
                      group: controller.menuIndex,
                      width: controller.menuWidth,
                      onChanged: controller.changeMenuIndex,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: {
              1 : SettingConfigLayout(),
              2 : SettingThemeLayout(),
              3 : SettingInfoLayout(),
            }[controller.menuIndex]!)
          ],
        ),
      )
    ));
  }
}
