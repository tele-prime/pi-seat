import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';

class EntertainmentMenuWidget extends StatelessWidget {
  final String icon;
  final String label;
  final TvConnection isLoading;
  final bool isAvailable;
  final NeumorphicButtonClickListener onPressed;

  const EntertainmentMenuWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.isLoading,
    required this.isAvailable,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double width = Get.width / 5;
    return Expanded(
      child: Center(
        child: SizedBox(
          width: width,
          height: width,
          child: NeumorphicButton(
            onPressed: onPressed,
            style: SssStyleTheme().getMenu(),
            padding: const EdgeInsets.all(8.0),
            child: Center(child: (isLoading == TvConnection.scanning) ? CircularProgressIndicator() : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (isLoading == TvConnection.connected) ? Image.asset('assets/icons/${icon}_icon.png', width: 60) : SizedBox(),
                Text(label, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isAvailable ? SssColor.black : Colors.grey.withAlpha(150),
                )),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
