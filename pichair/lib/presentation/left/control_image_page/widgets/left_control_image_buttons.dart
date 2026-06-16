import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/left/control_image_page/controller/left_control_image_page_controller.dart';

class LeftControlImageButtons extends StatelessWidget {
  const LeftControlImageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeftControlImagePageController>(builder: (controller) => SizedBox(
      width: controller.contentWidth,
      height: controller.contentHeight,
      child: Row(
        children: [
          SizedBox(
              width: controller.contentHeight - 10,
              height: controller.contentHeight - 10,
              child: GestureDetector(
                onTapDown: (d) => controller.leftMovement(),
                onTapCancel: controller.stopMovement,
                child: NeumorphicButton(
                  onPressed: (){},
                  style: SssStyleTheme().getMenu(radius: 20),
                  padding: const EdgeInsets.all(0.1),
                  child: Center(
                    child: Icon(Icons.arrow_left),
                  ),
                ),
              )
          ),
          SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 40,
              child: Neumorphic(
                style: SssStyleTheme().getMenu(radius: 20),
                child: Center(
                  child: Text(controller.selectedImageLabel, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: SssColor.black,
                  ),),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
              width: controller.contentHeight - 10,
              height: controller.contentHeight - 10,
              child: GestureDetector(
                onTapDown: (d) => controller.rightMovement(),
                onTapCancel: controller.stopMovement,
                child: NeumorphicButton(
                  onPressed: (){},
                  style: SssStyleTheme().getMenu(radius: 20),
                  padding: const EdgeInsets.all(0.1),
                  child: Center(
                    child: Icon(Icons.arrow_right),
                  ),
                ),
              )
          ),
        ],
      ),
    ));
  }
}
