import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/entertainment_page/controller/entertainment_page_controller.dart';
import 'package:pichair/presentation/entertainment_page/widgets/entertainment_appbar.dart';
import 'package:pichair/presentation/entertainment_page/widgets/entertainment_menus.dart';

class EntertainmentPage extends StatelessWidget {
  const EntertainmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EntertainmentPageController>(
      builder: (controller) => NeumorphicTheme(
        themeMode: currentThemeMode.value,
        darkTheme: NeumorphicThemeData.dark(
          shadowLightColor: SssColor.grey.withAlpha(140),
        ),
        child: Scaffold(
          body: Stack(children: [
            EntertainmentMenus(),
            EntertainmentAppbar()
            ]),
        ),
      ),
    );
  }
}
