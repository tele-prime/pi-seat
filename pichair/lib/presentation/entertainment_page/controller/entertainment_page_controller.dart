import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:udev/udev.dart';

class EntertainmentPageController extends GetxController {
  TvConnection isScanningTv = TvConnection.disconnected;
  bool isScanningUsb = true;
  bool isUsbAvailable = false;
  String? tvIpAddress;
  bool launching = false;

  @override
  void onInit() {
    super.onInit();
    scanToTvIp();
  }

  void scanToTvIp() async {
    if(isScanningTv != TvConnection.scanning){
      isScanningTv = TvConnection.scanning;
      update();
      var result = await Process.run('adb', ['devices', '-l']);
      String deviceIp = result.stdout.toString().replaceAll('List of devices attached', '').split(' ').first.trim();
      if(deviceIp.isNotEmpty){
        tvIpAddress = deviceIp;
        isScanningTv = TvConnection.connected;
        update();
      }else{
        tvIpAddress = null;
        isScanningTv = TvConnection.disconnected;
        update();
      }

    }
  }

  void launch(String package) async {
    if(launching == false){
      launching = true;
      try {
        await Process.run('adb', [
          '-s', tvIpAddress!,
          'shell', 'monkey',
          '-p', package,
          '-c', 'android.intent.category.LAUNCHER', '1',
        ]);
        backToLaunchFalse();
      } catch (e) {
        print("ADB Error: $e");
        backToLaunchFalse();
      }
    }
  }

  void openSettings() async {
    try {
      await Process.run('adb', [
        '-s', tvIpAddress!,
        'shell',
        'am', 'start', '-a', 'android.settings.SETTINGS'
      ]);
    } catch (e) {
      print("ADB Error: $e");
    }
  }

  void backToLaunchFalse(){
    Future.delayed(Duration(seconds: 3), (){
      launching = false;
    });
  }

  void scanUsb() async {
    print('#### start scan');
    isScanningUsb = true;
    update();
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      final udev = UdevContext();
      final devices = udev.enumerateDevices(
        subsystems: ['block'],
        properties: {'ID_BUS': 'usb'},
      );

      if (devices.isNotEmpty) {
        final device = UdevDevice.fromSyspath(devices.first, context: udev);
        final devicePath = device.properties['DEVNAME'];
        if (devicePath != null) {
          final isMounted = await _isDeviceMounted(devicePath);
          if (!isMounted) {
            await _mountDevice(devicePath);
          } else {
            print('#### USB device $devicePath is already mounted.');
          }
        }
      }

      bool isExist = await Directory('/mnt/usb').exists();
      if (isExist) {
        final files = Directory('/mnt/usb').listSync();
        isUsbAvailable = files.isNotEmpty;
      } else {
        isUsbAvailable = false;
      }
    } catch (e) {
      isUsbAvailable = false;
    } finally {
      isScanningUsb = false;
      update();
    }
  }

  Future<bool> _isDeviceMounted(String devicePath) async {
    final mounts = await File('/proc/mounts').readAsLines();
    for (var line in mounts) {
      final parts = line.split(' ');
      if (parts.isNotEmpty && parts[0] == devicePath) {
        return true;
      }
    }
    return false;
  }

  Future<void> _mountDevice(String devicePath) async {
    try {
      await Process.start(
        'sudo',
        ['mount', devicePath, '/mnt/usb'],
        mode: ProcessStartMode.detached,
      );
      // Add a small delay to allow the mount to complete
      await Future.delayed(const Duration(seconds: 2));
    } catch (e) {
      print('Error mounting device: $e');
    }
  }

}
