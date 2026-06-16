import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/right/control_button_page/controller/right_control_button_page_controller.dart';
import 'package:pichair/presentation/right/control_button_page/widgets/rcbiw_flipped.dart';
import 'package:pichair/presentation/right/control_button_page/widgets/rcbl_flipped.dart';
import 'package:pichair/presentation/right/control_button_page/widgets/rcvli_flipped.dart';
import 'package:pichair/presentation/right/control_button_page/widgets/right_control_button_appbar.dart';
import 'package:pichair/presentation/right/control_button_page/widgets/right_control_button_image_widget.dart';
import 'package:pichair/presentation/right/control_button_page/widgets/right_control_button_label.dart';
import 'package:pichair/presentation/right/control_button_page/widgets/right_control_button_line.dart';
import 'package:pichair/presentation/right/control_button_page/widgets/right_control_button_list.dart';

class RightControlButtonPage extends StatelessWidget {
  const RightControlButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RightControlButtonPageController>(builder: (controller) => NeumorphicTheme(
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
            RightControlButtonImageWidget(),
            RightControlButtonLine(),
            RightControlButtonList(),
            Positioned(
                right: 20,
                bottom: 20,
                child: RightControlButtonLabel(
                  label: 'arm'.tr,
                  vertical: true,
                  leftPress: (details) => controller.startMovement(ChairMovement.handUpward),
                  leftCancel: controller.stopMovement,
                  rightPress: (details) => controller.startMovement(ChairMovement.handDownward),
                  rightCancel: controller.stopMovement,
                )
            ),
            RightControlButtonAppbar(),
          ],
        ),
      )
    ));
  }
}
