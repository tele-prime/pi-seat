import 'dart:io';
import 'package:get/get.dart';
import 'package:udev/udev.dart';

class MoviePageController extends GetxController {
  List<File> movies = [];
  bool isLoading = false;
  bool isUsbFound = false;

  @override
  void onInit() {
    super.onInit();
    scanMovies();
  }

  Future<void> scanMovies() async {
    isLoading = true;
    update();
    movies.clear();
    isUsbFound = false;

    try {
      String mountPath = '/mnt/usb';
      if (mountPath != null) {
        print('#### mount path = $mountPath');
        isUsbFound = true;
        await _searchVideoFiles(Directory(mountPath));
      }
    } catch (e) {
      print('Error scanning movies: $e');
    } finally {
      isLoading = false;
      update();
    }
  }

  // Future<String?> _getUsbMountPoint() async {
  //   try {
  //     final udev = UdevContext();
  //
  //     // We search for all block devices.
  //     // We'll filter for USB and 'partition' type.
  //     final devices = udev.enumerateDevices(
  //       subsystems: ['block'],
  //     );
  //
  //     if (devices.isEmpty) return null;
  //
  //     final mounts = await File('/proc/mounts').readAsLines();
  //
  //     for (var syspath in devices) {
  //       final device = UdevDevice.fromSyspath(syspath, context: udev);
  //
  //       // Check if this specific block device is a USB device
  //       final idBus = device.getPropertyValue('ID_BUS');
  //       final devNode = device.devnode;
  //
  //       if (idBus == 'usb' && devNode != null) {
  //         print('#### Checking mount status for: $devNode');
  //
  //         // Look for an exact match in /proc/mounts
  //         for (var line in mounts) {
  //           final parts = line.split(RegExp(r'\s+'));
  //           if (parts.isNotEmpty && parts[0] == devNode) {
  //             print('#### Match found! Mounted at: ${parts[1]}');
  //             return parts[1];
  //           }
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     print('Error finding mount point: $e');
  //   }
  //   return null;
  // }

  Future<void> _searchVideoFiles(Directory dir) async {
    try {
      if (await dir.exists()) {
        await for (final entity in dir.list(
          recursive: true,
          followLinks: false,
        )) {
          if (entity is File && _isVideoFile(entity.path)) {
            movies.add(entity);
          }
        }
      }
    } catch (e) {
      print('Error searching directory ${dir.path}: $e');
    }
  }

  bool _isVideoFile(String path) {
    final ext = path.split('.').last.toLowerCase();
    return ['mp4', 'mkv', 'avi', 'mov', 'wmv', 'flv', 'webm'].contains(ext);
  }
}
