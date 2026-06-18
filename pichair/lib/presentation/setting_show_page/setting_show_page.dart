import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/setting_show_page/controllers/setting_show_page_controller.dart';

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
              Expanded(child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
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
                  ],
                ),
              ))
            ],
          ),
        )
    ));
  }
}
