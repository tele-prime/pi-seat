import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/right/control_image_page/widgets/right_control_image_chair.dart';
import 'package:pichair/presentation/right/control_image_page/controller/right_control_image_page_controller.dart';
import 'package:pichair/presentation/right/control_image_page/widgets/right_control_image_buttons.dart';
import 'package:pichair/presentation/right/control_image_page/widgets/right_control_image_page_appbar.dart';

class RightControlImagePage extends StatelessWidget {
  const RightControlImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RightControlImagePageController>(builder: (controller) => NeumorphicTheme(
        themeMode: currentThemeMode.value,
        darkTheme: NeumorphicThemeData.dark(
          shadowLightColor: SssColor.grey.withAlpha(140),
        ),
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // Image.asset(
              //   'assets/images/AirbusSeat.jpg',
              //   fit: BoxFit.cover,
              // ),
              Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: RightControlImageChair()
              ),
              Positioned(
                  left: 40,
                  top: 90,
                  child: controller.currentImage == ChairImage.none ? SizedBox() : RightControlImageButtons()
              ),
              Positioned(
                  left: 0,
                  top: 0,
                  child: RightControlImagePageAppbar()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
