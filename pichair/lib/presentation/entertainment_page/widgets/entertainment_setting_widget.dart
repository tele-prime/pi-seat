import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/style_theme.dart';

class EntertainmentSettingWidget extends StatelessWidget {

  final NeumorphicButtonClickListener? onPressed;

  const EntertainmentSettingWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        NeumorphicButton(
          onPressed: onPressed,
          style: SssStyleTheme().getMenu(radius: 10),
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          child: Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: Icon(Icons.settings, color: Get.theme.cardColor, size: 20),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
