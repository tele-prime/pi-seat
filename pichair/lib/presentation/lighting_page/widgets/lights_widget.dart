import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/lighting_page/controller/lighting_page_controller.dart';

class LightsWidget extends StatelessWidget {
  const LightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LightingPageController>(builder: (controller) => Row(
      children: [
        Expanded(child: LightSelector(
          image: 'light',
          isTurnOn: !controller.isReadingLightOn,
          onTap: controller.changeReadingLightStatus,
        )),
        Expanded(child: LightSelector(
          image: 'light',
          isTurnOn: !controller.isTableLampOn,
          onTap: controller.changeTableLightStatus,
        )),
        Expanded(child: LightSelector(
          image: 'light',
          isTurnOn: !controller.isSeatLightOn,
          onTap: controller.changeSeatLightStatus,
        )),
        Expanded(child: LightSelector(
          image: 'light',
          isTurnOn: !controller.isPrivacyLightOn,
          onTap: controller.changePrivacyLightStatus,
        )),
      ],
    ));
  }
}

class LightSelector extends StatelessWidget {

  final String image;
  final bool isTurnOn;
  final Function() onTap;

  const LightSelector({
    super.key,
    required this.image,
    required this.isTurnOn,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(isTurnOn ? 'assets/lights/${image}_on.png' : 'assets/lights/${image}_off.png', fit: BoxFit.cover),

          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: SizedBox(
              width: 50,
              height: 50,
              child: Row(
                children: [
                  Expanded(child: SizedBox()),
                  NeumorphicButton(
                    onPressed: onTap,
                    style: SssStyleTheme().getMenu(radius: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    child: Center(
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: GlowIcon(Icons.lightbulb_outline,
                              size: 20,
                              color: isTurnOn ? SssColor.yellow : Get.theme.cardColor
                          )
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              )
          ),)
        ],
      ),
    );
  }
}
