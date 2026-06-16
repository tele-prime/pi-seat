import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_android_controller.dart';

class TvIcons extends StatelessWidget {

  final String package;
  final String icon;
  final Function onIconPress;

  const TvIcons({
    super.key,
    required this.package,
    required this.icon,
    required this.onIconPress
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TvPageAndroidController>(builder: (controller) => Column(
      children: [
        Expanded(child: AspectRatio(
          aspectRatio: 1,
          child: NeumorphicButton(
            onPressed: () => onIconPress(),
            style: SssStyleTheme().getMenu(radius: 10),
            padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Image.asset('assets/logos/logo_$icon.png', width: 18),
          ),
        )),
        Text(icon.toUpperCase(), style: TextStyle(
          fontSize: 22,
          color: SssColor.black,
          fontWeight: FontWeight.bold
        ),)
      ],
    ));
  }
}
