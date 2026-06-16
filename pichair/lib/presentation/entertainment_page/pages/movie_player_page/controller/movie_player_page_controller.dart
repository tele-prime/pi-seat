import 'dart:async';
import 'dart:io';
import 'package:flutterpi_gstreamer_video_player/flutterpi_gstreamer_video_player.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MoviePlayerPageController extends GetxController {
  late VideoPlayerController videoPlayerController;
  bool isInitialized = false;
  String? filePath;
  bool areControlsVisible = true;
  Timer? _hideControlsTimer;

  @override
  void onInit() {
    super.onInit();
    filePath = Get.arguments as String?;
    print('#### MoviePlayerPageController initialized with filePath: $filePath');
    if (filePath != null) {
      FlutterpiVideoPlayer.registerWith();
      _initializePlayer();
    }
  }

  Future<void> _initializePlayer() async {
    videoPlayerController = VideoPlayerController.file(File(filePath!));

    try {
      await videoPlayerController.initialize();
      isInitialized = true;
      videoPlayerController.addListener(() {
        update();
      });
      update();
      videoPlayerController.play();
      _startHideControlsTimer();
    } catch (e) {
      print('Error initializing video player: $e');
      Get.snackbar('Error', 'Could not play video', snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    if (isInitialized) {
      videoPlayerController.dispose();
    }
    _hideControlsTimer?.cancel();
    super.onClose();
  }

  void togglePlayPause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
    _resetHideControlsTimer();
    update();
  }

  void toggleControlsVisibility() {
    areControlsVisible = !areControlsVisible;
    if (areControlsVisible) {
      _startHideControlsTimer();
    } else {
      _hideControlsTimer?.cancel();
    }
    update();
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 5), () {
      areControlsVisible = false;
      update();
    });
  }

  void _resetHideControlsTimer() {
    if (areControlsVisible) {
      _startHideControlsTimer();
    }
  }

  void resetHideControlsTimer() {
    _resetHideControlsTimer();
  }

  void forward10Seconds() {
    final newPosition = videoPlayerController.value.position + const Duration(seconds: 10);
    videoPlayerController.seekTo(newPosition);
    _resetHideControlsTimer();
  }

  void backward10Seconds() {
    final newPosition = videoPlayerController.value.position - const Duration(seconds: 10);
    videoPlayerController.seekTo(newPosition);
    _resetHideControlsTimer();
  }
}
