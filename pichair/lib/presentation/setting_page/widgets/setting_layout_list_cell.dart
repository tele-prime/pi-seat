import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/color_theme.dart';

class SettingLayoutListCell extends StatelessWidget {

  final String label;
  final int value;
  final int group;
  final NeumorphicRadioListener<int?> onChanged;

  const SettingLayoutListCell({
    super.key,
    required this.label,
    required this.value,
    required this.group,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        height: 70,
        color: SssColor.tranBlack,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label.tr, style: TextStyle(
                fontSize: 14
            )),
            Expanded(child: SizedBox()),
            NeumorphicRadio(
              value: value,
              groupValue: group,
              onChanged: onChanged,
              style: NeumorphicRadioStyle(
                selectedColor: Get.theme.highlightColor.withAlpha(90),
                unselectedColor: Get.theme.scaffoldBackgroundColor,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.check, size: 20),
              ),
            ),
            SizedBox(width: 10)
          ],
        ),
      ),
    );
  }
}
