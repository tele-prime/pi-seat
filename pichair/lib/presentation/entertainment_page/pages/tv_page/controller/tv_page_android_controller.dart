import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/service/sss_gpio_service.dart';
import 'package:pichair/presentation/home_menu_page/controllers/home_menu_page_controller.dart';
import 'package:pichair/presentation/widgets/sss_keyboard_layout.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

class TvPageAndroidController extends GetxController {
  late SssKeyboardLayout sssKeyboardLayout;
  bool shiftEnabled = false;
  double keyboardSize = 180;
  DragUpdateDetails localDetail = DragUpdateDetails(globalPosition: Offset(0, 0));
  TvLayout currentLayout = TvLayout.remote;

  SssGpioService gpioService = Get.find();
  HomeMenuPageController homeMenuPageController = Get.find();

  TvDrawer currentDrawer = TvDrawer.none;

  DateTime? _lastCommandTime;
  bool _isMoving = false;


  int currentIndex = -1;
  bool isPlaying = false;
  bool isDialogOpen = false;

  List tvIconList = [
    {
      'package':'com.fise.preview',
      'icon':'tablet'
    },
    // {
    //   'package':'com.google.android.apps.nbu.files',
    //   'icon':'files'
    // },
    {
      'package':'com.android.providers.media',
      'icon':'movie'
    },
    {
      'package':'com.android.musicfx',
      'icon':'music'
    },
    // {
    //   'package':'app.organicmaps',
    //   'icon':'organic'
    // },
  ];

  @override
  void onInit() {
    super.onInit();
    sssKeyboardLayout = SssKeyboardLayout();
  }

  void changeLayout(TvLayout newLayout) {
    currentLayout = newLayout;
    update();
  }

  void _send(List<String> adbArgs) async {
    try {
      await Process.run('adb', [
        '-s', homeMenuPageController.tvIpAddress!,
        'shell', 'input',
        ...adbArgs
      ]);
    } catch (e) {
      print("ADB Error: $e");
    }
  }

  void _sendShell(List<String> shellArgs) async {
    try {
      await Process.run('adb', [
        '-s',homeMenuPageController. tvIpAddress!,
        'shell',
        ...shellArgs
      ]);
    } catch (e) {
      print("ADB Error: $e");
    }

  }

  void openSettings() async {
    try {
      await Process.run('adb', [
        '-s', homeMenuPageController.tvIpAddress!,
        'shell',
        'am', 'start', '-a', 'android.settings.SETTINGS'
      ]);
    } catch (e) {
      print("ADB Error: $e");
    }
  }

  void launch(String package) async {
    try {
      await Process.run('adb', [
        '-s', homeMenuPageController.tvIpAddress!,
        'shell', 'monkey',
        '-p', package,
        '-c', 'android.intent.category.LAUNCHER', '1',
      ]);
    } catch (e) {
      print("ADB Error: $e");
    }
  }

  void onKeyboardPress(VirtualKeyboardKey key) async {
    if (key.action == VirtualKeyboardKeyAction.Shift) {
      shiftEnabled = !shiftEnabled;
      update();
      return;
    }

    if (key.action == VirtualKeyboardKeyAction.Backspace) {
      _send(['keyevent', '67']); // KEYCODE_DEL
    } else if (key.action == VirtualKeyboardKeyAction.Return) {
      _send(['keyevent', '66']); // KEYCODE_ENTER
    } else if (key.text != null) {
      _send(['text', key.text!]);
    }
  }

  void onTouchPositionUpdate(DragUpdateDetails details) async {
    localDetail = details;
    _isMoving = true;

    final now = DateTime.now();
    if (_lastCommandTime == null || now.difference(_lastCommandTime!) > Duration(milliseconds: 100)) {
      _lastCommandTime = now;

      int x = localDetail.localPosition.dx.toInt();
      int y = localDetail.localPosition.dy.toInt();

      _send(['swipe', '$x', '$y', '$x', '$y', '0']);
      print('#### update moving = $_isMoving #### ${now.toLocal().toString()}');
    }
    print('#### moving = $_isMoving #### ${now.toLocal().toString()}');
  }

  void onTouchTap() {
    if (!_isMoving) {
      int x = localDetail.localPosition.dx.toInt();
      int y = localDetail.localPosition.dy.toInt();
      _send(['tap', '$x', '$y']);
    }
  }

  void onTouchEnd(DragEndDetails details) {
    Future.delayed(Duration(milliseconds: 100), () {
      _isMoving = false;
    });
  }

  void play() => _send(['keyevent', '85']);        // KEYCODE_MEDIA_PLAY_PAUSE
  void stop() => _send(['keyevent', '86']);        // KEYCODE_MEDIA_STOP
  void next() => _send(['keyevent', '87']);        // KEYCODE_MEDIA_NEXT
  void previous() => _send(['keyevent', '88']);    // KEYCODE_MEDIA_PREVIOUS

  void volumeUp() => _send(['keyevent', '24']);    // KEYCODE_VOLUME_UP
  void volumeDown() => _send(['keyevent', '25']);  // KEYCODE_VOLUME_DOWN
  void arrowUp() => _send(['keyevent', '19']);     // KEYCODE_DPAD_UP
  void arrowDown() => _send(['keyevent', '20']);   // KEYCODE_DPAD_DOWN
  void arrowLeft() => _send(['keyevent', '21']);   // KEYCODE_DPAD_LEFT
  void arrowRight() => _send(['keyevent', '22']);  // KEYCODE_DPAD_RIGHT
  void pressOk() => _send(['keyevent', '23']);     // KEYCODE_DPAD_CENTER

  void pressBack() => _send(['keyevent', '4']);    // KEYCODE_BACK

  void pressHome() async {
    _send(['keyevent', '3']);
    await Future.delayed(Duration(milliseconds: 100));
    _sendShell(['am', 'kill-all']);
    String shellScript = "for taskId in \$(dumpsys activity recents | grep -Eo 'taskId=[0-9]+' | cut -d= -f2); do am task remove \$taskId; done";
    _sendShell([shellScript]);
  }

  void tapDownTvButton() async {
    if(gpioService.currentChairMovement == ChairMovement.none){
      gpioService.currentChairMovement = ChairMovement.tv;
      update();
      gpioService.startVoltage();
      await Future.delayed(Duration(milliseconds: 400));
      tapUpTvButton();
    }
  }

  void tapUpTvButton(){
    if(gpioService.currentChairMovement != ChairMovement.none){
      gpioService.stopVoltage();
      update();
    }
  }

  void stopAndCloseDialog() {
    update();
    if (Get.isDialogOpen ?? false) {
      Get.close(1);
    }
  }

  void playMusic(String musicUri) async {
    _sendShell([
      'am', 'start',
      '-a', 'android.intent.action.VIEW',
      '-d', musicUri,
      '-t', 'audio/mpeg',
      '-p', 'org.videolan.vlc'
    ]);

    await Future.delayed(const Duration(milliseconds: 500));

    _sendShell([
      'am', 'start',
      '-n', 'org.videolan.vlc/org.videolan.vlc.StartActivity'
    ]);
  }

  void playMovie(String movieUri) {
    _sendShell([
      'am',
      'start',
      '-a', 'android.intent.action.VIEW',
      '-d', movieUri,
      '-t', 'video/mp4'
    ]);
  }

}
