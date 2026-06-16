import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/right/control_touch_page/controllers/right_control_touch_page_controller.dart';

class RightControlTouchPageAppbar extends StatelessWidget {

  final double size;

  const RightControlTouchPageAppbar({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RightControlTouchPageController>(builder: (controller) => Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: 50,
        height: 50,
        child: NeumorphicButton(
          onPressed: () => Get.back(),
          style: SssStyleTheme().getMenu(radius: 10),
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          child: Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: Icon(Icons.home, size: 20),
            ),
          ),
        ),
      ),
    ));
  }
}
