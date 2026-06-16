import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';

class HomeBulbWidget extends StatelessWidget {

  final String icon;
  final NeumorphicButtonClickListener onPressed;
  final bool isActive;

  const HomeBulbWidget({super.key, required this.onPressed, required this.icon, required this.isActive});

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
              child: Center(
                child: GlowIcon(Icons.lightbulb_outline,
                    size: width/2,
                    color: isActive ? SssColor.yellow : Get.theme.cardColor
                ),
              ),
              // child: Image.asset('assets/images/$icon.png',
              //   fit: BoxFit.contain,
              //   color: SssColor.black,
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
