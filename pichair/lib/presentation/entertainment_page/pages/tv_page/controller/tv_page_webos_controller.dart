// // import 'dart:io';
// // import 'package:flutter/cupertino.dart';
// // import 'package:get/get.dart';
// // import 'package:pichair/app/enum/sss_enum.dart';
// // import 'package:pichair/presentation/entertainment_page/controller/entertainment_page_controller.dart';
// // import 'package:pichair/presentation/widgets/sss_keyboard_layout.dart';
// // import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
// //
// // class TvPageWebOsController extends GetxController {
// //   late SssKeyboardLayout sssKeyboardLayout;
// //   bool shiftEnabled = false;
// //   double keyboardSize = 180;
// //
// //   DragUpdateDetails localDetail = DragUpdateDetails(globalPosition: Offset(0, 0));
// //   TvLayout currentLayout = TvLayout.remote;
// //
// //   EntertainmentPageController ent = Get.find();
// //
// //   Process? _cecProcess;
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     sssKeyboardLayout = SssKeyboardLayout();
// //     _initCecConnection();
// //   }
// //
// //   @override
// //   void onClose() {
// //     _cecProcess?.kill();
// //     super.onClose();
// //   }
// //
// //   void changeLayout(TvLayout newLayout) {
// //     currentLayout = newLayout;
// //     update();
// //   }
// //
// //   Future<void> _initCecConnection() async {
// //     try {
// //       _cecProcess = await Process.start('cec-client', [
// //         '-t', 'p',
// //         '-o', 'PiChair',
// //         '-d', '1',
// //         '/dev/cec1'
// //       ]);
// //       print('CEC persistent connection established as Playback Device (Address 4).');
// //     } catch (e) {
// //       print('Failed to start CEC client: $e');
// //     }
// //   }
// //
// //   void _sendCecCommand(String command) {
// //     print('CEC command ... $command');
// //     if (_cecProcess != null) {
// //       _cecProcess!.stdin.writeln(command);
// //     } else {
// //       print('CEC is not connected. Reconnecting...');
// //       _initCecConnection();
// //     }
// //   }
// //
// //   void _sendHexCommand(String hexCode) async {
// //     _sendCecCommand('tx 40:44:$hexCode');
// //     await Future.delayed(Duration(milliseconds: 480));
// //     _sendCecCommand('tx 40:45');
// //   }
// //
// //   void onTapApp(String packageName) {
// //     print("CEC cannot launch webOS packages directly.");
// //   }
// //
// //   void onKeyboardPress(VirtualKeyboardKey key) async {
// //     if (key.action == VirtualKeyboardKeyAction.Shift) {
// //       shiftEnabled = !shiftEnabled;
// //       update();
// //       return;
// //     }
// //
// //     if (key.action == VirtualKeyboardKeyAction.Backspace) {
// //       pressBack();
// //     } else if (key.action == VirtualKeyboardKeyAction.Return) {
// //       pressOk();
// //     } else if (key.text != null) {
// //       print("CEC does not support direct text injection for: ${key.text}");
// //     }
// //   }
// //
// //   void play() => _sendHexCommand('44');
// //   void pause() => _sendHexCommand('46');
// //   void next() => _sendHexCommand('4B');
// //   void previous() => _sendHexCommand('4C');
// //
// //   void powerOn() => _sendCecCommand('on 0');
// //   void powerOff() => _sendCecCommand('standby 0');
// //
// //   void volumeUp() => _sendCecCommand('volup');
// //   void volumeDown() => _sendCecCommand('voldown');
// //
// //   void arrowUp() => _sendHexCommand('01');
// //   void arrowDown() => _sendHexCommand('02');
// //   void arrowLeft() => _sendHexCommand('03');
// //   void arrowRight() => _sendHexCommand('04');
// //   void pressOk() => _sendHexCommand('00');
// //
// //   void pressHome() => _sendHexCommand('09');
// //   void pressBack() => _sendHexCommand('0D');
// // }
//
//
//
// // import 'dart:io';
// //
// // import 'package:flutter/cupertino.dart';
// // import 'package:get/get.dart';
// // import 'package:pichair/app/enum/sss_enum.dart';
// // import 'package:pichair/presentation/entertainment_page/controller/entertainment_page_controller.dart';
// // import 'package:pichair/presentation/widgets/sss_keyboard_layout.dart';
// // import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
// //
// // class TvPageWebOsController extends GetxController {
// //   Socket? _socket;
// //
// //   final String socketPath = '/tmp/hid_bridge.sock';
// //   late SssKeyboardLayout sssKeyboardLayout;
// //   bool shiftEnabled = false;
// //   double keyboardSize = 180;
// //
// //   DragUpdateDetails localDetail = DragUpdateDetails(globalPosition: Offset(0, 0));
// //   TvLayout currentLayout = TvLayout.remote;
// //
// //   EntertainmentPageController ent = Get.find();
// //
// //   Process? _cecProcess;
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     _connectToBridge();
// //   }
// //
// //   void changeLayout(TvLayout newLayout) {
// //     currentLayout = newLayout;
// //     update();
// //   }
// //
// //   Future<void> _connectToBridge() async {
// //     try {
// //       _socket = await Socket.connect(
// //         InternetAddress(socketPath, type: InternetAddressType.unix),
// //         0, // timeout
// //       );
// //       print('Connected to HID bridge socket');
// //     } catch (e) {
// //       print('Failed to connect to socket at $socketPath: $e');
// //       // Note: You may want to add a timer here to auto-retry the connection
// //     }
// //   }
// //
// //   void _sendCommand(String command) {
// //     if (_socket != null) {
// //       // Send the command followed by a newline character to frame the message
// //       _socket!.write('$command\n');
// //       print('Sent: $command');
// //     } else {
// //       print('Socket not connected. Cannot send $command');
// //       _connectToBridge(); // Attempt to reconnect if the socket dropped
// //     }
// //   }
// //
// //   void onKeyboardPress(VirtualKeyboardKey key) async {
// //
// //   }
// //
// //   // D-Pad Actions
// //   void sendUp() => _sendCommand('UP');
// //   void sendDown() => _sendCommand('DOWN');
// //   void sendLeft() => _sendCommand('LEFT');
// //   void sendRight() => _sendCommand('RIGHT');
// //   void sendEnter() => _sendCommand('ENTER');
// //   void sendBack() => _sendCommand('BACK');
// //
// //
// //
// //   void play() => _sendCommand('DOWN');
// //   void pause() => _sendCommand('DOWN');
// //   void next() => _sendCommand('DOWN');
// //   void previous() => _sendCommand('DOWN');
// //
// //   void powerOn() => _sendCommand('DOWN');
// //   void powerOff() => _sendCommand('DOWN');
// //
// //   void volumeUp() => _sendCommand('DOWN');
// //   void volumeDown() => _sendCommand('DOWN');
// //
// //   void arrowUp() => _sendCommand('UP');
// //   void arrowDown() => _sendCommand('DOWN');
// //   void arrowLeft() => _sendCommand('LEFT');
// //   void arrowRight() => _sendCommand('RIGHT');
// //   void pressOk() => _sendCommand('ENTER');
// //
// //   void pressHome() => _sendCommand('DOWN');
// //   void pressBack() =>_sendCommand('DOWN');
// //
// //   @override
// //   void onClose() {
// //     _socket?.destroy();
// //     super.onClose();
// //   }
// // }
//
//
// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:pichair/app/enum/sss_enum.dart';
// import 'package:pichair/presentation/entertainment_page/controller/entertainment_page_controller.dart';
// import 'package:pichair/presentation/widgets/sss_keyboard_layout.dart';
// import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
//
// class TvPageWebOsController extends GetxController {
//   Socket? _socket;
//
//   final String socketPath = '/tmp/hid_bridge.sock';
//   late SssKeyboardLayout sssKeyboardLayout;
//   bool shiftEnabled = false;
//   double keyboardSize = 180;
//
//   DragUpdateDetails localDetail = DragUpdateDetails(globalPosition: Offset(0, 0));
//   TvLayout currentLayout = TvLayout.remote;
//
//   EntertainmentPageController ent = Get.find();
//
//   Process? _cecProcess;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _connectToBridge();
//   }
//
//   void changeLayout(TvLayout newLayout) {
//     currentLayout = newLayout;
//     update();
//   }
//
//   Future<void> _connectToBridge() async {
//     try {
//       _socket = await Socket.connect(
//         InternetAddress(socketPath, type: InternetAddressType.unix),
//         0, // timeout
//       );
//       print('Connected to HID bridge socket');
//     } catch (e) {
//       print('Failed to connect to socket at $socketPath: $e');
//       // Note: You may want to add a timer here to auto-retry the connection
//     }
//   }
//
//   void _sendCommand(String command) {
//     if (_socket != null) {
//       // Send the command followed by a newline character to frame the message
//       _socket!.write('$command\n');
//       print('Sent: $command');
//     } else {
//       print('Socket not connected. Cannot send $command');
//       _connectToBridge(); // Attempt to reconnect if the socket dropped
//     }
//   }
//
//   void onKeyboardPress(VirtualKeyboardKey key) async {
//
//   }
//
//   // --- Media Controls ---
//   void play() => _sendCommand('PLAY');
//   void pause() => _sendCommand('PAUSE');
//   void next() => _sendCommand('NEXT');
//   void previous() => _sendCommand('PREVIOUS');
//
//   // --- Power Controls ---
//   // Note: Most TVs use the same IR/Bluetooth code to toggle power.
//   // If you find out WebOS has discrete ON/OFF codes later, you can split these into 'POWER_ON' and 'POWER_OFF'.
//   void powerOn() => _sendCommand('POWER');
//   void powerOff() => _sendCommand('POWER');
//
//   // --- Volume Controls ---
//   void volumeUp() => _sendCommand('VOL_UP');
//   void volumeDown() => _sendCommand('VOL_DOWN');
//
//   // --- D-Pad & Navigation ---
//   void arrowUp() => _sendCommand('UP');
//   void arrowDown() => _sendCommand('DOWN');
//   void arrowLeft() => _sendCommand('LEFT');
//   void arrowRight() => _sendCommand('RIGHT');
//   void pressOk() => _sendCommand('ENTER');
//
//   // --- System Navigation ---
//   void pressHome() => _sendCommand('HOME');
//   void pressBack() => _sendCommand('BACK');
//
//   // // D-Pad Actions
//   // void sendUp() => _sendCommand('UP');
//   // void sendDown() => _sendCommand('DOWN');
//   // void sendLeft() => _sendCommand('LEFT');
//   // void sendRight() => _sendCommand('RIGHT');
//   // void sendEnter() => _sendCommand('ENTER');
//   // void sendBack() => _sendCommand('BACK');
//   //
//   //
//   //
//   // void play() => _sendCommand('DOWN');
//   // void pause() => _sendCommand('DOWN');
//   // void next() => _sendCommand('DOWN');
//   // void previous() => _sendCommand('DOWN');
//   //
//   // void powerOn() => _sendCommand('DOWN');
//   // void powerOff() => _sendCommand('DOWN');
//   //
//   // void volumeUp() => _sendCommand('DOWN');
//   // void volumeDown() => _sendCommand('DOWN');
//   //
//   // void arrowUp() => _sendCommand('UP');
//   // void arrowDown() => _sendCommand('DOWN');
//   // void arrowLeft() => _sendCommand('LEFT');
//   // void arrowRight() => _sendCommand('RIGHT');
//   // void pressOk() => _sendCommand('ENTER');
//   //
//   // void pressHome() => _sendCommand('DOWN');
//   // void pressBack() =>_sendCommand('DOWN');
//
//   @override
//   void onClose() {
//     _socket?.destroy();
//     super.onClose();
//   }
// }