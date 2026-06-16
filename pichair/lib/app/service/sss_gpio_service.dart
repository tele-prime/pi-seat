import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';

class SssGpioService extends GetxService {

  ChairMovement currentChairMovement = ChairMovement.none;
  bool currentReadingLightStatus = false;
  bool currentTableLampStatus = false;
  bool currentSeatLightStatus = false;
  bool currentPrivacyLightStatus = false;

  // var backBackward = GPIO(15, GPIOdirection.gpioDirOut);
  // var backForward = GPIO(18, GPIOdirection.gpioDirOut);
  // var handUpward = GPIO(23, GPIOdirection.gpioDirOut);
  // var handDownward = GPIO(24, GPIOdirection.gpioDirOut);
  // var seatForward = GPIO(1, GPIOdirection.gpioDirOut);
  // var seatBackward = GPIO(25, GPIOdirection.gpioDirOut);
  // var legUpward = GPIO(12, GPIOdirection.gpioDirOut);
  // var legDownward = GPIO(16, GPIOdirection.gpioDirOut);
  // var footForward = GPIO(14, GPIOdirection.gpioDirOut);
  // var footBackward = GPIO(20, GPIOdirection.gpioDirOut);

  // var privacyLight = GPIO(5, GPIOdirection.gpioDirOut);
  // var seatLight = GPIO(6, GPIOdirection.gpioDirOut);
  // var tableLamp = GPIO(13, GPIOdirection.gpioDirOut);
  // var readingLighting = GPIO(0, GPIOdirection.gpioDirOut);
  // var tv = GPIO(26, GPIOdirection.gpioDirOut);
  //
  // var customGround = GPIO(19, GPIOdirection.gpioDirOut);

  // var ir = GPIO(17, GPIOdirection.gpioDirIn);

  @override
  void onInit() {
    super.onInit();
    startLightingInitialize();
    // tv.write(true);
    //initIR();
  }

  @override
  void onClose() {
    super.onClose();
    // backBackward.dispose();
    // backForward.dispose();
    // handUpward.dispose();
    // handDownward.dispose();
    // seatForward.dispose();
    // seatBackward.dispose();
    // legUpward.dispose();
    // legDownward.dispose();
    // footForward.dispose();
    // footBackward.dispose();
    // readingLighting.dispose();
    // tv.dispose();
  }


  void startVoltage() {
    switch (currentChairMovement) {
      case ChairMovement.backBackward:
        // backBackward.write(true);
        break;
      case ChairMovement.backForward:
        // backForward.write(true);
        break;
      case ChairMovement.handUpward:
        // handUpward.write(true);
        break;
      case ChairMovement.handDownward:
        // handDownward.write(true);
        break;
      case ChairMovement.seatForward:
        // seatForward.write(true);
        break;
      case ChairMovement.seatBackward:
        // seatBackward.write(true);
        break;
      case ChairMovement.legUpward:
        // legUpward.write(true);
        break;
      case ChairMovement.legDownward:
        // legDownward.write(true);
        break;
      case ChairMovement.footForward:
        // footForward.write(true);
        break;
      case ChairMovement.footBackward:
        // footBackward.write(true);
        break;
      case ChairMovement.tv:
        // tv.write(false);
        break;
      case ChairMovement.none:
        // do something
        break;
    }
  }

  void stopVoltage() async {
    switch (currentChairMovement) {
      case ChairMovement.backBackward:
        // backBackward.write(false);
        break;
      case ChairMovement.backForward:
        // backForward.write(false);
        break;
      case ChairMovement.handUpward:
        // handUpward.write(false);
        break;
      case ChairMovement.handDownward:
        // handDownward.write(false);
        break;
      case ChairMovement.seatForward:
        // seatForward.write(false);
        break;
      case ChairMovement.seatBackward:
        // seatBackward.write(false);
        break;
      case ChairMovement.legUpward:
        // legUpward.write(false);
        break;
      case ChairMovement.legDownward:
        // legDownward.write(false);
        break;
      case ChairMovement.footForward:
        // footForward.write(false);
        break;
      case ChairMovement.footBackward:
        // footBackward.write(false);
        break;
      case ChairMovement.tv:
        // tv.write(true);
        break;
      case ChairMovement.none:

        break;
      case null:
        // do nothing
        break;
    }
    currentChairMovement = ChairMovement.none;
  }

  Future<void> togglePrivacyLight() async {
    currentPrivacyLightStatus = !currentPrivacyLightStatus;
    // privacyLight.write(currentPrivacyLightStatus);
  }

  Future<void> toggleSeatLight() async {
    currentSeatLightStatus = !currentSeatLightStatus;
    // seatLight.write(currentSeatLightStatus);
  }

  Future<void> toggleTableLamp() async {
    currentTableLampStatus = !currentTableLampStatus;
    // tableLamp.write(currentTableLampStatus);
  }

  Future<void> toggleReadingLight() async {
    currentReadingLightStatus = !currentReadingLightStatus;
    // readingLighting.write(currentReadingLightStatus);
  }

  void startLightingInitialize(){
    currentReadingLightStatus = true;
    currentTableLampStatus = true;
    currentSeatLightStatus = true;
    currentPrivacyLightStatus = true;

    // privacyLight.write(currentPrivacyLightStatus);
    // seatLight.write(currentSeatLightStatus);
    // tableLamp.write(currentTableLampStatus);
    // readingLighting.write(currentReadingLightStatus);
  }

  // Future<void> sendTvSignal() async {
  //   tv.write(true);
  //   await Future.delayed(Duration(milliseconds: 500));
  //   tv.write(false);
  //   await Future.delayed(Duration(milliseconds: 50));
  // }



  // void remote() {
  //   //useSharedLibray();
  //
  //   try {
  //     ir.setGPIOedge(GPIOedge.gpioEdgeBoth);
  //     int lastTime = 0;
  //     List<int> pulseDurations = [];
  //
  //     while (true) {
  //       var event = ir.getGPIOedge();
  //
  //       if (event != GPIOedge.gpioEdgeNone) {
  //         int currentTime = DateTime.now().microsecondsSinceEpoch;
  //
  //         if (lastTime != 0) {
  //           int duration = currentTime - lastTime;
  //           if (duration > 10000) {
  //             if (pulseDurations.isNotEmpty) {
  //               Get.bottomSheet(Container(
  //                 color: SssColor.white,
  //                 child: Text('Captured pulse sequence: $pulseDurations'),
  //               ));
  //               pulseDurations.clear();
  //             }
  //           } else {
  //             // Add the pulse width to our list
  //             pulseDurations.add(duration);
  //           }
  //         }
  //         lastTime = currentTime;
  //       }
  //     }
  //   } catch (e) {
  //     Get.bottomSheet(Container(
  //       color: SssColor.white,
  //       child: Text('Error $e'),
  //     ));
  //   } finally {
  //     ir.dispose();
  //   }
  // }

}