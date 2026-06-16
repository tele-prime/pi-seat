import 'package:get/get.dart';
import 'package:pichair/app/service/sss_gpio_service.dart';

class LightingPageController extends GetxController {

  SssGpioService service = Get.find();
  bool isReadingLightOn = false;
  bool isTableLampOn = false;
  bool isSeatLightOn = false;
  bool isPrivacyLightOn = false;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(microseconds: 200), (){
      isReadingLightOn = service.currentReadingLightStatus;
      isTableLampOn = service.currentTableLampStatus;
      isSeatLightOn = service.currentSeatLightStatus;
      isPrivacyLightOn = service.currentPrivacyLightStatus;
      update();
    });
  }

  void changeReadingLightStatus() async {
    await service.toggleReadingLight();
    isReadingLightOn = service.currentReadingLightStatus;
    update();
  }

  void changeTableLightStatus() async {
    await service.toggleTableLamp();
    isTableLampOn = service.currentTableLampStatus;
    update();
  }

  void changeSeatLightStatus() async {
    await service.toggleSeatLight();
    isSeatLightOn = service.currentSeatLightStatus;
    update();
  }

  void changePrivacyLightStatus() async {
    await service.togglePrivacyLight();
    isPrivacyLightOn = service.currentPrivacyLightStatus;
    update();
  }

}