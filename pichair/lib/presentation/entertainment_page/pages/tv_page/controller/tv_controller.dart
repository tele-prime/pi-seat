// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:pichair/app/enum/sss_enum.dart';
// import 'package:pichair/app/service/bluetooth_service.dart';
// import 'package:pichair/presentation/widgets/sss_keyboard_layout.dart';
// import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
//
// class TvPageController extends GetxController {
//   late SssKeyboardLayout sssKeyboardLayout;
//   // final BluetoothService _bt = BluetoothService();
//
//   bool shiftEnabled = false;
//   double keyboardSize = 180;
//   DragUpdateDetails localDetail = DragUpdateDetails(globalPosition: Offset(0, 0));
//   TvLayout currentLayout = TvLayout.apps;
//
//   @override
//   void onInit() {
//     super.onInit();
//     sssKeyboardLayout = SssKeyboardLayout();
//     // _bt.init(); // [cite: 3, 4]
//   }
//
//   @override
//   void onClose() {
//     // _bt.dispose();
//     super.onClose();
//   }
//
//   void changeLayout(TvLayout newLayout){
//     currentLayout = newLayout;
//     update(); // [cite: 5]
//   }
//
//   // Protocol: [Type, Value...]
//   // 1: Remote, 2: Keyboard, 3: Move, 4: Click
//   void _send(int type, List<int> payload) {
//     // _bt.sendCommand([type, ...payload]);
//   }
//
//   void onKeyboardPress(VirtualKeyboardKey key) async {
//     if (key.action == VirtualKeyboardKeyAction.Shift) {
//       shiftEnabled = !shiftEnabled;
//       update(); // [cite: 6, 7]
//       return;
//     }
//     if (key.text != null) {
//       _send(2, key.text!.codeUnits);
//     }
//   }
//
//   void onTouchPositionUpdate(DragUpdateDetails details) async {
//     localDetail = details;
//     int x = localDetail.localPosition.dx.toInt();
//     int y = localDetail.localPosition.dy.toInt();
//     // Sending X and Y coordinates as 2 bytes each [cite: 8]
//     _send(3, [x >> 8, x & 0xFF, y >> 8, y & 0xFF]);
//   }
//
//   void onTouchTap(){
//     _send(4, [0x01]); // [cite: 9]
//   }
//
//   // Media & Navigation Commands [cite: 10, 11]
//   void play() => _send(1, [0x10]);
//   void pause() => _send(1, [0x11]);
//   void next() => _send(1, [0x12]);
//   void previous() => _send(1, [0x13]);
//   void volumeUp() => _send(1, [0x20]);
//   void volumeDown() => _send(1, [0x21]);
//
//   void arrowUp() => _send(1, [0x01]);
//   void arrowDown() => _send(1, [0x02]);
//   void arrowLeft() => _send(1, [0x03]);
//   void arrowRight() => _send(1, [0x04]);
//   void pressOk() => _send(1, [0x05]);
// }
//
//
//
// // package:com.netflix.mediaclient
// // package:com.aurora.store
// // package:com.weather.forecast.weatherchannel
// // package:com.zhiliaoapp.musically
// // package:com.snapchat.android
// // package:tv.twitch.android.app
// // package:com.facebook.orca
// // package:com.reddit.frontpage
// // package:com.whatsapp
// // package:com.quora.android
// // package:com.pinterest
// // package:org.mozilla.firefox
// // package:com.yelp.android
// // package:com.spotify.music
// // package:com.hulu.plus
// // package:com.amazon.mShop.android.shopping
// // package:com.facebook.katana
// // package:com.skype.raider
// // package:com.twitter.android
// // package:org.telegram.messenger
// // package:com.disney.disneyplus
// // package:com.htunaunglinn.hidreceiver
// // package:us.zoom.videomeetings
// // package:com.peacocktv.peacockandroid
// // package:com.einnovation.temu
// // package:com.instagram.android
