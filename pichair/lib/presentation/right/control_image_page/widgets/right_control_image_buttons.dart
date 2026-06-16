import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/right/control_image_page/controller/right_control_image_page_controller.dart';

class RightControlImageButtons extends StatelessWidget {
  const RightControlImageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RightControlImagePageController>(builder: (controller) => SizedBox(
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
                    child: Icon((
                        controller.currentImage == ChairImage.leg ||
                            controller.currentImage == ChairImage.hand
                    ) ? Icons.arrow_drop_up : Icons.arrow_left),
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
                    child: Icon((
                        controller.currentImage == ChairImage.leg ||
                            controller.currentImage == ChairImage.hand
                    ) ? Icons.arrow_drop_down : Icons.arrow_right),
                    // child: Icon(Icons.arrow_right),
                  ),
                ),
              )
          ),
        ],
      ),
    ));
  }
}
