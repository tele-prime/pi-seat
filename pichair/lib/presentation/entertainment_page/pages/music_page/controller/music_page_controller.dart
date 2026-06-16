import 'dart:io';
import 'package:get/get.dart';
import 'package:udev/udev.dart';

class MusicPageController extends GetxController {
  List<File> musics = [];
  bool isLoading = false;
  bool isUsbFound = false;

  @override
  void onInit() {
    super.onInit();
    scanMusic();
  }

  Future<void> scanMusic() async {
    isLoading = true;
    update();
    musics.clear();
    isUsbFound = false;

    try {
      String? mountPath = await _findUsbMountPath();
      if (mountPath != null) {
        isUsbFound = true;
        await _searchAudioFiles(Directory(mountPath));
      }
    } catch (e) {
      print('Error scanning music: $e');
    } finally {
      isLoading = false;
      update();
    }
  }

    Future<String?> _findUsbMountPath() async {
    try {
      final udev = UdevContext();
      final devices = udev.enumerateDevices(
        subsystems: ['block'],
        properties: {'ID_BUS': 'usb'},
      );
      print('#### scan done ${devices.length}');

      if (devices.isEmpty) return null;

      final device = UdevDevice.fromSyspath(devices.first, context: udev);
      return device.devpath;
    } catch (e) {
      print('Error finding USB mount path: $e');
    }
    return null;
  }

  Future<void> _searchAudioFiles(Directory dir) async {
    try {
      if (await dir.exists()) {
        await for (final entity in dir.list(
          recursive: true,
          followLinks: false,
        )) {
          if (entity is File && _isAudioFile(entity.path)) {
            musics.add(entity);
          }
        }
      }
    } catch (e) {
      print('Error searching directory ${dir.path}: $e');
    }
  }

  bool _isAudioFile(String path) {
    final ext = path.split('.').last.toLowerCase();
    return ['mp3', 'wav', 'aac', 'flac', 'ogg', 'm4a'].contains(ext);
  }
}
