import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/style_theme.dart';

class LeftControlButtonLabel extends StatelessWidget {

  final bool? vertical;
  final String label;
  final GestureTapDownCallback leftPress;
  final GestureTapCancelCallback leftCancel;
  final GestureTapDownCallback rightPress;
  final GestureTapCancelCallback rightCancel;

  const LeftControlButtonLabel({
    super.key,
    required this.label,
    this.vertical = false,
    required this.leftPress,
    required this.leftCancel,
    required this.rightPress,
    required this.rightCancel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
                onTapDown: leftPress,
                onTapCancel: leftCancel,
                child: NeumorphicButton(
                  onPressed: (){},
                  style: SssStyleTheme().getMenu(radius: 20),
                  padding: const EdgeInsets.all(0.1),
                  child: Center(
                    child: Icon(vertical! ? Icons.arrow_drop_up : Icons.arrow_left),
                  ),
                ),
              )
          ),
          ...currentLabelAvailability.value ? <Widget>[
            SizedBox(width: 10),
            SizedBox(
              width: 100,
              height: 30,
              child: Neumorphic(
                style: SssStyleTheme().getMenu(radius: 20),
                child: Center(
                  child: Text(label),
                ),
              ),
            ),
            SizedBox(width: 10),
          ] :  <Widget>[
            SizedBox(width: 10)
          ],
          Expanded(
              child: GestureDetector(
                onTapDown: rightPress,
                onTapCancel: rightCancel,
                child: NeumorphicButton(
                  onPressed: (){},
                  style: SssStyleTheme().getMenu(radius: 20),
                  padding: const EdgeInsets.all(0.1),
                  child: Center(
                    child: Icon(vertical! ? Icons.arrow_drop_down : Icons.arrow_right),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
