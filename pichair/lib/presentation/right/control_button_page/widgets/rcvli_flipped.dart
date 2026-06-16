import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/presentation/right/control_button_page/controller/right_control_button_page_controller.dart';
import 'package:pichair/presentation/right/control_button_page/widgets/right_control_button_label.dart';

class RightControlButtonListFlipped extends StatelessWidget {
  const RightControlButtonListFlipped({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RightControlButtonPageController>(builder: (controller) => Row(
      children: [
        SizedBox(width: 10),
        SizedBox(
          width: 200,
          height: Get.height,
          child: ListView(
            children: [
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RightControlButtonLabel(
                  label: 'seat'.tr,
                  leftPress: (details) => controller.startMovement(ChairMovement.seatBackward),
                  leftCancel: controller.stopMovement,
                  rightPress: (details) => controller.startMovement(ChairMovement.seatForward),
                  rightCancel: controller.stopMovement,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RightControlButtonLabel(
                  label: 'leg'.tr,
                  vertical: true,
                  leftPress: (details) => controller.startMovement(ChairMovement.legUpward),
                  leftCancel: controller.stopMovement,
                  rightPress: (details) => controller.startMovement(ChairMovement.legDownward),
                  rightCancel: controller.stopMovement,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RightControlButtonLabel(
                  label: 'foot'.tr,
                  leftPress: (details) => controller.startMovement(ChairMovement.footForward),
                  leftCancel: controller.stopMovement,
                  rightPress: (details) => controller.startMovement(ChairMovement.footBackward),
                  rightCancel: controller.stopMovement,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 30),
        SizedBox(
          width: 200,
          height: Get.height,
          child: ListView(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RightControlButtonLabel(
                  label: 'back'.tr,
                  leftPress: (details) => controller.startMovement(ChairMovement.backBackward),
                  leftCancel: controller.stopMovement,
                  rightPress: (details) => controller.startMovement(ChairMovement.backForward),
                  rightCancel: controller.stopMovement,
                ),
              ),
            ],
          ),
        ),
        Expanded(child: SizedBox()),
      ],
    ));
  }
}