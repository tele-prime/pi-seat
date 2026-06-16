import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/presentation/right/control_icon_page/controller/right_control_icon_page_controller.dart';
import 'package:pichair/presentation/right/control_icon_page/widgets/right_control_icon_button_widget.dart';

class RightControlIconList extends StatelessWidget {
  const RightControlIconList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RightControlIconPageController>(builder: (controller) => Row(
      children: [
        Expanded(child: SizedBox()),
        Column(
          children: [
            SizedBox(height: 10),
            RightControlIconButtonWidget(
              index: 1,
              label: 'back'.tr,
              leftClick: (d) => controller.startMovement(ChairMovement.backForward),
              rightClick: (d) => controller.startMovement(ChairMovement.backBackward),
            ),
            SizedBox(height: 10),
            RightControlIconButtonWidget(
              index: 2,
              label: 'arm'.tr,
              leftClick: (d) => controller.startMovement(ChairMovement.handUpward),
              rightClick: (d) => controller.startMovement(ChairMovement.handDownward),
              vertical: true,
            ),
            SizedBox(height: 10),
            RightControlIconButtonWidget(
              index: 3,
              label: 'seat'.tr,
              leftClick: (d) => controller.startMovement(ChairMovement.seatForward),
              rightClick: (d) => controller.startMovement(ChairMovement.seatBackward),
            ),
            SizedBox(height: 10),
            RightControlIconButtonWidget(
              index: 4,
              label: 'leg'.tr,
              leftClick: (d) => controller.startMovement(ChairMovement.legUpward),
              rightClick: (d) => controller.startMovement(ChairMovement.legDownward),
              vertical: true,
            ),
            SizedBox(height: 10),
            RightControlIconButtonWidget(
              index: 5,
              label: 'foot'.tr,
              leftClick: (d) => controller.startMovement(ChairMovement.footBackward),
              rightClick: (d) => controller.startMovement(ChairMovement.footForward),
            ),
            SizedBox(height: 10),
          ],
        ),
        Expanded(child: SizedBox()),
      ],
    ));
  }
}
