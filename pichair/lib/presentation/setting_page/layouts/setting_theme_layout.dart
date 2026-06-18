import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/setting_page/controller/setting_page_controller.dart';
import 'package:pichair/presentation/setting_page/widgets/setting_layout_list_cell.dart';

class SettingThemeLayout extends StatelessWidget {
  const SettingThemeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPageController>(builder: (controller) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
        SettingLayoutListCell(
            label: 'layout_touch_1'.tr,
            value: 1,
            group: controller.currentSelectedDesignPosition,
            onChanged:(position) => controller.changeLayoutDesign(position),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: SssColor.dividerBlack,
          ),
          // SettingLayoutListCell(
          //   label: 'layout_button_1'.tr,
          //   value: 2,
          //   group: controller.currentSelectedDesignPosition,
          //   onChanged:(position) => controller.changeLayoutDesign(position),
          // ),
          // Divider(
          //   height: 1,
          //   thickness: 1,
          //   color: SssColor.dividerBlack,
          // ),
          // SettingLayoutListCell(
          //   label: 'layout_icon_1'.tr,
          //   value: 3,
          //   group: controller.currentSelectedDesignPosition,
          //   onChanged:(position) => controller.changeLayoutDesign(position),
          // ),
          // Divider(
          //   height: 1,
          //   thickness: 1,
          //   color: SssColor.dividerBlack,
          // ),
          // SettingLayoutListCell(
          //   label: 'layout_image_1'.tr,
          //   value: 4,
          //   group: controller.currentSelectedDesignPosition,
          //   onChanged:(position) => controller.changeLayoutDesign(position),
          // ),
          // Divider(
          //   height: 1,
          //   thickness: 1,
          //   color: SssColor.dividerBlack,
          // ),
          SettingLayoutListCell(
            label: 'layout_none'.tr,
            value: 0,
            group: controller.currentSelectedDesignPosition,
            onChanged:(position) => controller.changeLayoutDesign(position),
          ),
        ],
      ),
    ));
  }
}
