import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';

class SettingShowThemeMenuWidget extends StatelessWidget {

  final String label;
  final ThemeMode value;
  final double width;
  final ThemeMode group;
  final NeumorphicRadioListener<ThemeMode> onChanged;

  const SettingShowThemeMenuWidget({
    super.key,
    required this.label,
    required this.value,
    required this.group,
    required this.onChanged,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicRadio<ThemeMode>(
      value: value,
      groupValue: group,
      onChanged: (ThemeMode? data) => onChanged(data!),
      style: NeumorphicRadioStyle(
          selectedDepth: 2,
          selectedColor: Get.theme.cardColor.withAlpha(120)
      ),
      child: SizedBox(
        height: 40,
        width: width,
        child: Center(
          child: NeumorphicText(label, textStyle: NeumorphicTextStyle(
              decoration: TextDecoration.overline,
              fontFamily: 'Pyidaungsu',
              fontSize: 14
          ),
              style: NeumorphicStyle(
                color: Get.theme.textTheme.titleLarge?.color?? Colors.red,
              )),
        ),
      ),

    );
  }
}
