import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';
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
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: NeumorphicButton(
                      onPressed: controller.changeThemeMode,
                      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                      style: SssStyleTheme().getMenu(radius: 10),
                      child: Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.lightbulb,
                            size: 20,
                          ),
                          // child: Icon(Icons.lightbulb, color: controller.testing ? SssColor.green : SssColor.red, size: 20,),
                        ),
                      ),
                    ),
                  )
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
                  NeumorphicRadio(
                    value: 'en',
                    groupValue: controller.languageCode,
                    onChanged: controller.changeLocale,
                    style: NeumorphicRadioStyle(
                      selectedColor: SssColor.blueGrey,
                      unselectedColor: SssColor.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/flags/us.png', width: 40,),
                    ),
                  ),
                  SizedBox(width: 20),
                  NeumorphicRadio(
                    value: 'my',
                    groupValue: controller.languageCode,
                    style: NeumorphicRadioStyle(
                      selectedColor: SssColor.blueGrey,
                      unselectedColor: SssColor.grey,
                    ),
                    onChanged: controller.changeLocale,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/flags/mm.png', width: 40,),
                    ),
                  ),
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
