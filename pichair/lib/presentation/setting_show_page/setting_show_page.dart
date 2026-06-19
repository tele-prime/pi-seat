import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/setting_show_page/controllers/setting_show_page_controller.dart';
import 'package:pichair/presentation/setting_show_page/widgets/setting_show_locale_menu_widget.dart';
import 'package:pichair/presentation/setting_show_page/widgets/setting_show_theme_menu_widget.dart';

class SettingShowPage extends StatelessWidget {
  const SettingShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingShowPageController>(builder: (controller) => NeumorphicTheme(
        themeMode: currentThemeMode.value,
        darkTheme: NeumorphicThemeData.dark(
          shadowLightColor: SssColor.grey.withAlpha(140),
          intensity: 1,
          depth: 2,
        ),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
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
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('setting_menu_theme'.tr, style: TextStyle(
                              fontSize: 18
                          )),
                          SizedBox(height: 10),
                          SizedBox(
                            child: AnimatedToggleSwitch<bool>.dual(
                              current: currentThemeMode.value == ThemeMode.light,
                              first: false,
                              second: true,
                              spacing: 50.0,
                              style: ToggleStyle(
                                borderColor: currentThemeMode.value == ThemeMode.light ? SssColor.lightScaffoldBackground : SssColor.darkScaffoldBackground,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 1.5),
                                  ),
                                ],
                              ),
                              borderWidth: 5.0,
                              height: 55,
                              onChanged: controller.changeThemeModeToggle,
                              styleBuilder: (b) => ToggleStyle(indicatorColor: b ? Colors.white : Colors.black,
                                backgroundColor: currentThemeMode.value == ThemeMode.light ? SssColor.lightScaffoldBackground : SssColor.darkScaffoldBackground,
                              ),
                              iconBuilder: (value) => value ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
                              textBuilder: (value) => value ? Center(child: Text('Light')) : Center(child: Text('Dark')),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SettingShowThemeMenuWidget(
                                label: 'Light',
                                value: ThemeMode.light,
                                group: currentThemeMode.value,
                                width: controller.menuWidth,
                                onChanged:(t) => controller.changeThemeMode(),
                              ),
                              SizedBox(width: 12),
                              SettingShowThemeMenuWidget(
                                label: 'Dark',
                                value: ThemeMode.dark,
                                group: currentThemeMode.value,
                                width: controller.menuWidth,
                                onChanged:(t) => controller.changeThemeMode(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('setting_menu_locale'.tr, style: TextStyle(
                              fontSize: 18
                          )),
                          SizedBox(height: 10),
                          SizedBox(
                            child: AnimatedToggleSwitch<String>.dual(
                              current: currentLocale.value.languageCode,
                              first: 'my',
                              second: 'en',
                              spacing: 50.0,
                              style: ToggleStyle(
                                borderColor: currentThemeMode.value == ThemeMode.light ? SssColor.lightScaffoldBackground : SssColor.darkScaffoldBackground,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 1.5),
                                  ),
                                ],
                              ),
                              borderWidth: 5.0,
                              height: 55,
                              onChanged: controller.changeLocale,
                              styleBuilder: (b) => ToggleStyle(indicatorColor: Colors.transparent,
                                  backgroundColor: Colors.transparent
                              ),
                              customIconBuilder: (c,s,d) {
                                debugPrint('Current locale = ${s.value} and ${d.current}');
                                return Center(child: Image.asset( d.current == 'my' ? 'assets/flags/mm.png' : 'assets/flags/us.png', width: 20,));
                              },
                              textBuilder: (value) => value == 'my' ? Center(child: Text('မြန်မာ')) : Center(child: Text('English')),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SettingShowLocaleMenuWidget(
                                label: 'မြန်မာ',
                                value: 'my',
                                group: currentLocale.value.languageCode,
                                width: controller.menuWidth,
                                onChanged: controller.changeLocale,
                              ),
                              SizedBox(width: 12),
                              SettingShowLocaleMenuWidget(
                                label: 'English',
                                value: 'en',
                                group: currentLocale.value.languageCode,
                                width: controller.menuWidth,
                                onChanged: controller.changeLocale,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        )
    ));
  }
}
