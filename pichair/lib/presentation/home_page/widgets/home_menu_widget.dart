import 'package:flutter_glow/flutter_glow.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';

class HomeMenuWidget extends StatelessWidget {

  final String icon;
  final NeumorphicButtonClickListener onPressed;

  const HomeMenuWidget({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    double width = Get.width/5;
    return Expanded(
      child: Center(
        child: SizedBox(
          width: width,
          height: width,
          child: NeumorphicButton(
            onPressed: onPressed,
            style: SssStyleTheme().getMenu(),
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: width/2,
              height: width/2,
              child: GlowIcon(IconData(0xe800, fontFamily: 'SeatIcon', fontPackage: null),
                  size: width/2,
                  color: currentThemeMode.value == ThemeMode.dark ? SssColor.whiteGrey : SssColor.blue
              ),
            ),
          ),
        ),
      ),
    );
  }
}
