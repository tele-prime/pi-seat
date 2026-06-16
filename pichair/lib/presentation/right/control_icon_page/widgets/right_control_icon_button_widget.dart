import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/right/control_icon_page/controller/right_control_icon_page_controller.dart';

class RightControlIconButtonWidget extends StatelessWidget {

  final int index;
  final String label;
  final GestureTapDownCallback? leftClick;
  final GestureTapDownCallback? rightClick;
  final bool? vertical;

  const RightControlIconButtonWidget({
    super.key,
    required this.index,
    required this.label,
    required this.leftClick,
    required this.rightClick,
    this.vertical = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RightControlIconPageController>(builder: (controller) => SizedBox(
      width: controller.contentWidth,
      height: controller.contentHeight,
      child: Row(
        children: [
          SizedBox(
              width: controller.contentHeight - 10,
              height: controller.contentHeight - 10,
              child: GestureDetector(
                onTapDown: leftClick,
                onTapCancel: controller.stopMovement,
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
          SizedBox(width: 10),
          SizedBox(
            width: 100,
            height: 40,
            child: Neumorphic(
              style: SssStyleTheme().getMenu(radius: 20),
              child: Center(
                child: Text(label, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: SssColor.black,
                ),),
              ),
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
              width: controller.contentHeight - 10,
              height: controller.contentHeight - 10,
              child: GestureDetector(
                onTapDown: rightClick,
                onTapCancel: controller.stopMovement,
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
          Expanded(child: SizedBox()),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Transform.flip(
                flipX: true,
                child: SizedBox(
                    width: controller.contentHeight,
                    height: controller.contentHeight,
                    child: Image.asset('assets/images/i0$index.png', fit: BoxFit.fill)
                ),
              )
          ),
        ],
      ),
    ));
  }
}
