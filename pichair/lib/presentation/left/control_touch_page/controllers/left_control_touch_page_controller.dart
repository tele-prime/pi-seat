import 'package:flutter/material.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:get/get.dart';
import 'package:pichair/app/service/sss_gpio_service.dart';

class LeftControlTouchPageController extends GetxController{

  bool showLabel = true;
  double labelWidth = 100;
  double labelHeight = 30;

  final GlobalKey<ScaffoldState> leftScaffoldKey = GlobalKey<ScaffoldState>();
  double screenRatio = Get.width/Get.height;

  double joyStickDot = 7;
  double joyStickTouch = 20;

  SssGpioService gpioService = Get.find();
  ChairMovement currentMovement = ChairMovement.none;
  double imgWidth = 3000;
  double imgHeight = 1500;
  double imgRatio = 2;

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

  void startMovement(ChairMovement newMovement) {
    if(gpioService.currentChairMovement == ChairMovement.none) {
      currentMovement = newMovement;
      gpioService.currentChairMovement = newMovement;
      update();
      gpioService.startVoltage();
    }else{

    }
  }

  void stopMovement(){
    if(gpioService.currentChairMovement != ChairMovement.none){
      gpioService.stopVoltage();
      currentMovement = ChairMovement.none;
      update();
    }
  }
}