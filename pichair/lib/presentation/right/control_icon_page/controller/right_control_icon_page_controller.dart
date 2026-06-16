import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/service/sss_gpio_service.dart';

class RightControlIconPageController extends GetxController {
  double contentWidth = 350;
  double contentHeight = 58;
  double contentButtonWidth = 240;

  SssGpioService gpioService = Get.find();
  ChairMovement controllerChairMovement = ChairMovement.none;

  void startMovement(ChairMovement newMovement) {
    if(gpioService.currentChairMovement == ChairMovement.none) {
      gpioService.currentChairMovement = newMovement;
      controllerChairMovement = newMovement;
      update();
      gpioService.startVoltage();
    }
  }

  void stopMovement() {
    if(gpioService.currentChairMovement != ChairMovement.none){
      gpioService.stopVoltage();
      controllerChairMovement = ChairMovement.none;
      update();
    }
  }
}