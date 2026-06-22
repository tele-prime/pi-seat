import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/setting_page/controller/setting_page_controller.dart';

class SettingConfigLayout extends StatelessWidget {
  const SettingConfigLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPageController>(builder: (controller) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('setting_menu_theme'.tr, style: TextStyle(
                      fontSize: 14
                  )),
                  Expanded(child: SizedBox()),
                  AnimatedToggleSwitch<bool>.dual(
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
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('setting_menu_position'.tr, style: TextStyle(
                      fontSize: 14
                  )),
                  Expanded(child: SizedBox()),
                  NeumorphicRadio(
                    value: 0,
                    groupValue: controller.currentPosition,
                    onChanged: controller.changePosition,
                    style: NeumorphicRadioStyle(
                      selectedColor: SssColor.blueGrey,
                      unselectedColor: SssColor.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('LEFT'),
                    ),
                  ),
                  SizedBox(width: 20),
                  NeumorphicRadio(
                    value: 1,
                    groupValue: controller.currentPosition,
                    style: NeumorphicRadioStyle(
                      selectedColor: SssColor.blueGrey,
                      unselectedColor: SssColor.grey,
                    ),
                    onChanged: controller.changePosition,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('RIGHT'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('setting_menu_locale'.tr, style: TextStyle(
                      fontSize: 14
                  )),
                  Expanded(child: SizedBox()),
                  AnimatedToggleSwitch<String>.dual(
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
                  // NeumorphicRadio(
                  //   value: 'en',
                  //   groupValue: controller.languageCode,
                  //   onChanged: controller.changeLocale,
                  //   style: NeumorphicRadioStyle(
                  //     selectedColor: SssColor.blueGrey,
                  //     unselectedColor: SssColor.grey,
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Image.asset('assets/flags/us.png', width: 40,),
                  //   ),
                  // ),
                  // SizedBox(width: 20),
                  // NeumorphicRadio(
                  //   value: 'my',
                  //   groupValue: controller.languageCode,
                  //   style: NeumorphicRadioStyle(
                  //     selectedColor: SssColor.blueGrey,
                  //     unselectedColor: SssColor.grey,
                  //   ),
                  //   onChanged: controller.changeLocale,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Image.asset('assets/flags/mm.png', width: 40,),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('setting_menu_label'.tr, style: TextStyle(
                      fontSize: 14
                  )),
                  Expanded(child: SizedBox()),
                  NeumorphicSwitch(
                    value: controller.showLabelStatus,
                    onChanged: controller.changeLabelStatus,
                    height: 30,
                    style: NeumorphicSwitchStyle(
                      activeTrackColor: Get.theme.highlightColor.withAlpha(90),
                      inactiveTrackColor: Get.theme.unselectedWidgetColor,

                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        )
    ));
  }
}
