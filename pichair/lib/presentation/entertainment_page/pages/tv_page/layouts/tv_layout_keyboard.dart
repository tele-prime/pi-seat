import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_android_controller.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

class TvLayoutKeyboard extends StatelessWidget {

  const TvLayoutKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TvPageAndroidController>(builder: (controller) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: Get.height - 100,
        child: VirtualKeyboard(
          textColor: Get.theme.textTheme.titleMedium!.color!,
          fontSize: 36,
          postKeyPress: controller.onKeyboardPress,
          alwaysCaps: controller.shiftEnabled,
          type: VirtualKeyboardType.Alphanumeric,
          customLayoutKeys: controller.sssKeyboardLayout,
          height: Get.height - 100,
        ),
      ),
    ));
  }
}
