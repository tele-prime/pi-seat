import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/left/control_button_page/controller/left_control_button_page_controller.dart';
import 'package:pichair/presentation/left/control_button_page/widgets/left_control_button_appbar.dart';
import 'package:pichair/presentation/left/control_button_page/widgets/left_control_button_image_widget.dart';
import 'package:pichair/presentation/left/control_button_page/widgets/left_control_button_label.dart';
import 'package:pichair/presentation/left/control_button_page/widgets/left_control_button_line.dart';
import 'package:pichair/presentation/left/control_button_page/widgets/left_control_button_list.dart';

class LeftControlButtonPage extends StatelessWidget {
  const LeftControlButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeftControlButtonPageController>(builder: (controller) => NeumorphicTheme(
        themeMode: currentThemeMode.value,
        darkTheme: NeumorphicThemeData.dark(
            shadowLightColor: SssColor.grey.withAlpha(140)
        ),
      child: Scaffold(
        body: Stack(
          children: [
            // Image.asset(
            //   'assets/images/AirbusSeat.jpg',
            //   fit: BoxFit.cover,
            // ),
            LeftControlButtonImageWidget(),
            LeftControlButtonLine(),
            LeftControlButtonList(),
            Positioned(
                left: 20,
                bottom: 20,
                child: LeftControlButtonLabel(
                  label: 'arm'.tr,
                  vertical: true,
                  leftPress: (details) => controller.startMovement(ChairMovement.handUpward),
                  leftCancel: controller.stopMovement,
                  rightPress: (details) => controller.startMovement(ChairMovement.handDownward),
                  rightCancel: controller.stopMovement,
                )
            ),
            LeftControlButtonAppbar(),
          ],
        ),
      )
    ));
  }
}
