import 'package:flutter/material.dart';
import 'package:flutterpi_gstreamer_video_player/flutterpi_gstreamer_video_player.dart';
import 'package:pichair/app/sss_massage_chair.dart';

void main() {
  FlutterpiVideoPlayer.registerWith();
  runApp(const SssMassageChair());
}

//$ flutterpi_tool devices add root@my-yocto-device --fs-layout=meta-flutter
// ssh-add ~/.ssh/id_rsa
// flutterpi_tool run -d 10.0.80.128 --debug

//c29809135135e262a912cf583b2c90deb9ded610
//https://storage.googleapis.com/flutter_infra_release/flutter/c29809135135e262a912cf583b2c90deb9ded610/linux-arm64/linux-arm64-flutter-gtk.zip

// flutterpi_tool build --release
// flutterpi_tool build --arch=arm64 --cpu=pi4 --release
// zip -r release/pichair.zip build/flutter-pi/pi4-64
// scp -r build/flutter-pi/pi4-64 aye@10.0.80.81:/home/aye/project/

// sudo systemctl enable pichair.service
// sudo systemctl start pichair.service
// sudo reboot

// sudo systemctl stop pichair.service
// sudo systemctl disable pichair.service
// sudo reboot



