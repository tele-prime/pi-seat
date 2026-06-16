import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/setting_page/controller/setting_page_controller.dart';

class SettingInfoUpdateRow extends StatelessWidget {
  const SettingInfoUpdateRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPageController>(builder: (controller) => SizedBox(
      height: 40,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(controller.updateAvailable ? 'Update version ${
          controller.latestVersion?.tagName.replaceAll('v', '1.')
          } is available' : 'Currently latest version'),
          SizedBox(
            width: 90,
            height: 40,
            child: NeumorphicButton(
              onPressed: () {
                Get.dialog(Dialog(
                    backgroundColor: Colors.transparent,
                    child: Center(
                      child: CircularProgressIndicator(color: SssColor.red,),
                    ),
                  ),
                  barrierDismissible: false,
                );
                controller.forceUpdate();
              },
              style: SssStyleTheme().getMenu(radius: 10),
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              child: Center(
                child: Text(controller.updateAvailable ? 'UPDATE' : 'REINSTALL'),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
