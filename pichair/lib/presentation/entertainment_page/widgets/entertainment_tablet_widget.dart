import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';

class EntertainmentTabletWidget extends StatelessWidget {
  final String icon;
  final String label;
  final TvConnection isLoading;
  final Color color;
  final NeumorphicButtonClickListener onPressed;

  const EntertainmentTabletWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.isLoading,
    required this.color,
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
            style: SssStyleTheme().getIconMenu(color: color),
            padding: const EdgeInsets.all(8.0),
            child: Center(child: (isLoading == TvConnection.scanning) ? CircularProgressIndicator() : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (isLoading == TvConnection.connected) ? Image.asset('assets/logos/logo_$icon.png', width: 60) : SizedBox(),
                Text(label, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: SssColor.black,
                )),
              ],
            )),
          ),
        ),
      ),
    );
    // return Row(
    //   children: [
    //     SizedBox(width: 50),
    //     NeumorphicButton(
    //       onPressed: onPressed,
    //       style: SssStyleTheme().getMenu(radius: 10),
    //       padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
    //       child: Center(
    //         child: SizedBox(
    //           width: 50,
    //           height: 50,
    //           child: Icon(Icons.tablet_mac, color: Get.theme.cardColor, size: 20),
    //         ),
    //       ),
    //     ),
    //     Expanded(child: SizedBox()),
    //   ],
    // );
  }
}
