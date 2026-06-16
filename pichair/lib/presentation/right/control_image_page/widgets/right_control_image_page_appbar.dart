import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/right/control_image_page/controller/right_control_image_page_controller.dart';

class RightControlImagePageAppbar extends StatelessWidget {
  const RightControlImagePageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RightControlImagePageController>(builder: (controller) => Padding(
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
