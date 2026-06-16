import 'dart:io';

import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';

class HomeMenuPageController extends GetxController {

  TvConnection isScanningTv = TvConnection.disconnected;
  String? tvIpAddress;
  List<Map<String, String>> movieFiles = [];
  List<Map<String, String>> musicFiles = [];
  Map<String, List<Map<String, String>>> categorizedMusic = {};
  Map<String, List<Map<String, String>>> categorizedMovie = {};
  List<String> artists = [];
  List<String> categories = [];

  @override
  void onInit() {
    super.onInit();
    scanToTvIp();
  }

  void resetConnection(){
    isScanningTv = TvConnection.disconnected;
    tvIpAddress = null;
    movieFiles.clear();
    musicFiles.clear();
    categorizedMusic.clear();
    categorizedMovie.clear();
    artists.clear();
    categories.clear();
    update();
    scanToTvIp();
  }

  void scanToTvIp() async {
    await Future.delayed(Duration(milliseconds: 200));
    if(isScanningTv != TvConnection.scanning){
      isScanningTv = TvConnection.scanning;
      update();
      var result = await Process.run('adb', ['devices', '-l']);
      await Future.delayed(Duration(seconds: 10));
      String deviceIp = result.stdout.toString().replaceAll('List of devices attached', '').split(' ').first.trim();
      if(deviceIp.isNotEmpty){
        isScanningTv = TvConnection.connected;
        tvIpAddress = deviceIp;
        update();
        _fetchMp4Uris();
        _fetchMp3Uris();
      }else{
        isScanningTv = TvConnection.disconnected;
        tvIpAddress = null;
        update();
      }

    }
    Future.delayed(Duration(minutes: 1), scanToTvIp);
  }

  void _fetchMp4Uris() async {
    if(movieFiles.isEmpty){
      try {
        var result = await Process.run('adb', [
          '-s', tvIpAddress!,
          'shell',
          'content query --uri content://media/external/file --projection _id:_data --where "_data LIKE \'%.mp4\' OR _data LIKE \'%.mkv\'"'
        ]);

        if (result.exitCode == 0) {
          String output = result.stdout.toString();
          List<String> lines = output.split('\n');

          for (String line in lines) {
            if (line.contains('_id=')) {
              RegExp idRegex = RegExp(r'_id=(\d+)');
              var idMatch = idRegex.firstMatch(line);

              RegExp dataRegex = RegExp(r'_data=(.*?)(?:,|$)');
              var dataMatch = dataRegex.firstMatch(line);

              if (idMatch != null && dataMatch != null) {
                String id = idMatch.group(1)!;
                String fullPath = dataMatch.group(1)!;

                String fileName = fullPath.split('/').last.replaceAll(RegExp(r'\.(mp4|mkv)$'), '');

                String fullUri = 'content://media/external/file/$id';
                movieFiles.add({
                  'name': fileName,
                  'uri': fullUri
                });
              }
            }
          }
          if(movieFiles.isNotEmpty){

            categorizeAllMovies(movieFiles);
          }
          update();
        } else {
          print("ADB MP4 Command failed: ${result.stderr}");
        }
      } catch (e) {
        print("ADB MP4 Process Error: $e");
      }
    }
  }

  void _fetchMp3Uris() async {
    if(musicFiles.isEmpty){
      try {
        var result = await Process.run('adb', [
          '-s', tvIpAddress!,
          'shell',
          'content query --uri content://media/external/file --projection _id:_data --where "_data LIKE \'%.mp3\'"'
        ]);

        if (result.exitCode == 0) {
          String output = result.stdout.toString();
          List<String> lines = output.split('\n');

          for (String line in lines) {
            if (line.contains('_id=')) {
              RegExp idRegex = RegExp(r'_id=(\d+)');
              var idMatch = idRegex.firstMatch(line);

              RegExp dataRegex = RegExp(r'_data=(.*?)(?:,|$)');
              var dataMatch = dataRegex.firstMatch(line);

              if (idMatch != null && dataMatch != null) {
                String id = idMatch.group(1)!;
                String fullPath = dataMatch.group(1)!;

                String fileName = fullPath.split('/').last.replaceAll('.mp3', '');

                String fullUri = 'content://media/external/file/$id';
                musicFiles.add({
                  'name': fileName,
                  'uri': fullUri
                });
              }
            }
          }
          musicFiles.sort((a, b) => a['name']!.toLowerCase().compareTo(b['name']!.toLowerCase()));
          update();
          if(musicFiles.isNotEmpty){
            categorizeAllMusic(musicFiles);
          }
        } else {
          print("ADB Command failed: ${result.stderr}");
        }
      } catch (e) {
        print("ADB Process Error: $e");
      }
    }
  }

  void categorizeAllMusic(List<Map<String, String>> musics) {
    for (var file in musics) {
      String name = file['name'] ?? '';
      String artistString = 'Unknown Artist';

      int startIndex = name.indexOf('(');
      int endIndex = name.lastIndexOf(')');

      if (startIndex != -1 && endIndex != -1 && startIndex < endIndex) {
        artistString = name.substring(startIndex + 1, endIndex);
      }

      List<String> artists = artistString.split('+').map((a) => a.trim()).toList();
      for (String artist in artists) {
        if (!categorizedMusic.containsKey(artist)) {
        categorizedMusic[artist] = [];
        }
        categorizedMusic[artist]!.add(file);
      }
    }
    artists = categorizedMusic.keys.toList();
    update();
  }

  void categorizeAllMovies(List<Map<String, String>> movies){
    for (var file in movies) {
      String name = file['name'] ?? '';
      String categoryString = 'Unknown Category';

      int startIndex = name.indexOf('(');
      int endIndex = name.lastIndexOf(')');

      if (startIndex != -1 && endIndex != -1 && startIndex < endIndex) {
        categoryString = name.substring(startIndex + 1, endIndex);
      }

      List<String> movieCategory = categoryString.split('+').map((a) => a.trim()).toList();
      for (String cat in movieCategory) {
        if (!categorizedMovie.containsKey(cat)) {
          categorizedMovie[cat] = [];
        }
        categorizedMovie[cat]!.add(file);
      }
    }
    categories = categorizedMovie.keys.toList();
    categories.sort();
    update();
  }
}