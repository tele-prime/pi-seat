import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/service/sss_service.dart';
import 'package:pichair/presentation/home_page/controllers/home_page_controller.dart';

class SettingShowPageController extends GetxController {

  SssService service = Get.find();

  String languageCode = 'en';
  double menuWidth = 100;




  void changeThemeMode() async {
    if(currentThemeMode.value == ThemeMode.dark){
      service.saveThemeMode(ThemeMode.light);
    }else{
      service.saveThemeMode(ThemeMode.dark);
    }
    await Future.delayed(const Duration(milliseconds: 300), update);
    HomePageController homePageController = Get.find();
    homePageController.update();
  }

  void changeThemeModeToggle(bool current) async {
    if(current){
      service.saveThemeMode(ThemeMode.light);
    }else{
      service.saveThemeMode(ThemeMode.dark);
    }
    await Future.delayed(const Duration(milliseconds: 300), update);
    HomePageController homePageController = Get.find();
    homePageController.update();
  }

  void changeLocale(String? localeString) async {
    Locale newLocale = {
      'en' : Locale('en', 'US'),
      'my' : Locale('my', 'MM'),
      null : Locale('en', 'US'),
    }[localeString]!;
    service.saveLocale(newLocale);
    fetchCurrentLocale();
  }

  void fetchCurrentLocale() async {
    languageCode = (Get.locale??Locale('en')).languageCode;
    await Future.delayed(const Duration(milliseconds: 200), update);
  }
}