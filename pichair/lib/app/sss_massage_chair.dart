import 'package:pichair/app/routes/app_pages.dart';
import 'package:pichair/app/routes/app_routes.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/service/sss_gpio_service.dart';
import 'package:pichair/app/service/sss_service.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/style_theme.dart';

import 'locale/label_text.dart';

class SssMassageChair extends StatelessWidget {
  const SssMassageChair({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      title: 'Massage Chair',
      getPages: AppPages.routes,
      translations: LabelText(),
      locale: currentLocale.value,
      fallbackLocale: Locale('en', 'US'),
      theme: SssStyleTheme.lightTheme,
      darkTheme: SssStyleTheme.darkTheme,
      themeMode: currentThemeMode.value,
      onInit: (){
        Get.putAsync(() async => SssService());
        Get.putAsync(() async => SssGpioService());
      },
      initialRoute: AppRoutes.splash,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
    ));
  }
}
