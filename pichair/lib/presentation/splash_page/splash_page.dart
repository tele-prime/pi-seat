import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/splash_page/controllers/splash_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashPageController>(builder: (controller) => Scaffold(
      backgroundColor: SssColor.milk,

    ));
  }
}
