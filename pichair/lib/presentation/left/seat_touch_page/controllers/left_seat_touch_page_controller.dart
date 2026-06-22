import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:get/get.dart';
import 'package:pichair/app/service/sss_gpio_service.dart';

class LeftSeatTouchPageController extends GetxController{

  double scaleMatrix = Get.width / 800;

  bool showLabel = true;
  double labelWidth = 100;
  double labelHeight = 30;
  double arrowOpacity = 0.7;
  double arrowSize = 50;

  bool left = true;
  int turnUp = 0;
  int turnLeft = 1;
  int turnDown = 2;
  int turnRight = 3;
  String arrowAssetName = "assets/lottie/arrow_white.json";

  final GlobalKey<ScaffoldState> leftScaffoldKey = GlobalKey<ScaffoldState>();
  double screenRatio = Get.width/Get.height;

  double joyStickDot = 7;
  double joyStickTouch = 20;

  SssGpioService gpioService = Get.find();
  ChairMovement currentMovement = ChairMovement.none;
  double imgWidth = 800;
  double imgHeight = 240;

  //back - x 215, y 70, w 160, h 185
  double c1x = 215;
  double c1y = 70;
  double c1w = 160;
  double c1h = 185;

  //arm - x 190, y 180, w 265, h 185
  double c2x = 190;
  double c2y = 180;
  double c2w = 265;
  double c2h = 185;

  //seat - x 275, y 225, w 200, h 120
  double c3x = 275;
  double c3y = 225;
  double c3w = 200;
  double c3h = 120;

  //leg - x 315, y 285, w 165, h 150
  double c4x = 315;
  double c4y = 285;
  double c4w = 165;
  double c4h = 150;

  //foot - x 445, y 330, w 275, h 150
  double c5x = 445;
  double c5y = 330;
  double c5w = 275;
  double c5h = 150;

  @override
  void onInit() {
    super.onInit();

  }

  void arrowFlip() {
    left = !left;
    update();
  }

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

  void touchControlX(StickDragDetails detail, ChairMovement high, ChairMovement low) {
    if(detail.x != 0 || detail.y != 0){
      if(detail.x > 0) {
        startMovement(high);
      }else if(detail.x < 0) {
        startMovement(low);
      }
    }else{
      stopMovement();
    }
    update();
  }

  void touchControlY(StickDragDetails detail, ChairMovement high, ChairMovement low) {
    if(detail.x != 0 || detail.y != 0){
      if(detail.y > 0) {
        startMovement(high);
      }else if(detail.y < 0) {
        startMovement(low);
      }
    }else{
      stopMovement();
    }
    update();
  }
}