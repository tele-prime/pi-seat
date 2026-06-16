import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/presentation/left/control_icon_page/controller/left_control_icon_page_controller.dart';
import 'package:pichair/presentation/left/control_icon_page/widgets/left_control_icon_button_widget.dart';

class LeftControlIconList extends StatelessWidget {
  const LeftControlIconList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeftControlIconPageController>(builder: (controller) => Row(
      children: [
        Expanded(child: SizedBox()),
        Column(
          children: [
            SizedBox(height: 10),
            LeftControlIconButtonWidget(
              index: 1,
              label: 'back'.tr,
              leftClick: (d) => controller.startMovement(ChairMovement.backBackward),
              rightClick: (d) => controller.startMovement(ChairMovement.backForward),
            ),
            SizedBox(height: 10),
            LeftControlIconButtonWidget(
              index: 2,
              label: 'arm'.tr,
              leftClick: (d) => controller.startMovement(ChairMovement.handUpward),
              rightClick: (d) => controller.startMovement(ChairMovement.handDownward),
              vertical: true,
            ),
            SizedBox(height: 10),
            LeftControlIconButtonWidget(
              index: 3,
              label: 'seat'.tr,
              leftClick: (d) => controller.startMovement(ChairMovement.seatBackward),
              rightClick: (d) => controller.startMovement(ChairMovement.seatForward),
            ),
            SizedBox(height: 10),
            LeftControlIconButtonWidget(
              index: 4,
              label: 'leg'.tr,
              leftClick: (d) => controller.startMovement(ChairMovement.legUpward),
              rightClick: (d) => controller.startMovement(ChairMovement.legDownward),
              vertical: true,
            ),
            SizedBox(height: 10),
            LeftControlIconButtonWidget(
              index: 5,
              label: 'foot'.tr,
              leftClick: (d) => controller.startMovement(ChairMovement.footForward),
              rightClick: (d) => controller.startMovement(ChairMovement.footBackward),
            ),
            SizedBox(height: 10),
          ],
        ),
        Expanded(child: SizedBox()),
      ],
    ));
  }
}
