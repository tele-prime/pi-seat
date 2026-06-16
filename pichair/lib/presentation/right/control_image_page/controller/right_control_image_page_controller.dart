import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/service/sss_gpio_service.dart';

class RightControlImagePageController extends GetxController {
  double imgWidth = 3000;
  double imgHeight = 1500;
  ChairMovement controllerChairMovement = ChairMovement.none;
  ChairImage currentImage = ChairImage.none;
  double contentWidth = 250;
  double contentHeight = 58;

  SssGpioService gpioService = Get.find();
  //1.x 600, y 80, w 660, h 670
  double c1x = 600;
  double c1y = 80;
  double c1w = 660;
  double c1h = 670;

  //2.x 750, y 450, w 900, h 800
  double c2x = 750;
  double c2y = 450;
  double c2w = 900;
  double c2h = 800;

  //3.x 1050, y 540, w 520, h 360
  double c3x = 1050;
  double c3y = 540;
  double c3w = 520;
  double c3h = 360;

  //4.x 1400, y 650, w 330, h 550
  double c4x = 1400;
  double c4y = 650;
  double c4w = 330;
  double c4h = 550;

  //5.x 1860, y 800, w 470, h 580
  double c5x = 1860;
  double c5y = 800;
  double c5w = 470;
  double c5h = 580;

  double circleRadius = 20;

  String get selectedImageLabel => {
        ChairImage.none: 'none',
        ChairImage.back: 'back'.tr,
        ChairImage.hand: 'arm'.tr,
        ChairImage.seat: 'seat'.tr,
        ChairImage.leg: 'leg'.tr,
        ChairImage.foot: 'foot'.tr,

      }[currentImage]!;

  // void startMovement(ChairMovement newMovement) {
  //   if(gpioService.currentChairMovement == ChairMovement.none) {
  //     gpioService.currentChairMovement = newMovement;
  //     controllerChairMovement = newMovement;
  //     update();
  //     gpioService.startVoltage();
  //   }
  // }

  void leftMovement(){
    if(gpioService.currentChairMovement == ChairMovement.none) {
      controllerChairMovement = {
        ChairImage.none : ChairMovement.none,
        ChairImage.back : ChairMovement.backForward,
        ChairImage.hand : ChairMovement.handUpward,
        ChairImage.seat : ChairMovement.seatForward,
        ChairImage.leg : ChairMovement.legUpward,
        ChairImage.foot : ChairMovement.footBackward,
      }[currentImage]!;
      gpioService.currentChairMovement = controllerChairMovement;
      update();
      gpioService.startVoltage();
    }
  }

  void rightMovement(){
    if(gpioService.currentChairMovement == ChairMovement.none) {
      controllerChairMovement = {
        ChairImage.none : ChairMovement.none,
        ChairImage.back : ChairMovement.backBackward,
        ChairImage.hand : ChairMovement.handDownward,
        ChairImage.seat : ChairMovement.seatBackward,
        ChairImage.leg : ChairMovement.legDownward,
        ChairImage.foot : ChairMovement.footForward,
      }[currentImage]!;
      gpioService.currentChairMovement = controllerChairMovement;
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
