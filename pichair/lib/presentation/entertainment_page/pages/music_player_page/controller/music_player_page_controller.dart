import 'package:get/get.dart';

class MusicPlayerPageController extends GetxController {
  bool isInitialized = false;
  String? filePath;

  @override
  void onInit() {
    super.onInit();
    filePath = Get.arguments as String?;
    if (filePath != null) {
      _initializePlayer();
    }
  }

  Future<void> _initializePlayer() async {

    try {
      isInitialized = true;
      update();
    } catch (e) {
      print('Error initializing music player: $e');
      Get.snackbar('Error', 'Could not play music');
    }
  }

  @override
  void onClose() {
    if (isInitialized) {
    }
    super.onClose();
  }

  void togglePlayPause() {
    update();
  }
}
