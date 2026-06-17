import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/app/constants/content_list.dart';
import 'package:pichair/app/enum/sss_enum.dart';

class HomeMenuPageController extends GetxController {

  TvConnection isScanningTv = TvConnection.disconnected;
  String? tvIpAddress;
  List<String> movieFiles = [];
  List<String> musicFiles = [];
  Map<String, List<String>> categorizedMusic = {};
  Map<String, List<String>> categorizedMovie = {};
  List<String> artists = [];
  List<String> categories = [];

  @override
  void onInit() {
    super.onInit();
    categorizeAllMusic();
    categorizeAllMovies();
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
  }

  void categorizeAllMusic() {
    for (String name in ContentList().musics) {
      String artistString = 'Unknown Artist';

      int startIndex = name.indexOf('(');
      int endIndex = name.lastIndexOf(')');

      if (startIndex != -1 && endIndex != -1 && startIndex < endIndex) {
        artistString = name.substring(startIndex + 1, endIndex);
      }

      // List<String> artists = artistString.split('+').map((a) => a.trim()).toList();
      // for (String artist in artists) {
        if (!categorizedMusic.containsKey(artistString)) {
        categorizedMusic[artistString] = [];
        }
        categorizedMusic[artistString]?.add(name);
      // }
      debugPrint("artist list => $artistString");
      debugPrint("artist => $categorizedMusic");
    }
    artists = categorizedMusic.keys.toList();
    debugPrint("artist => $artists");
    update();
  }

  void categorizeAllMovies(){
    for (String name in ContentList().movies) {
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
        categorizedMovie[cat]!.add(name);
      }
    }
    categories = categorizedMovie.keys.toList();
    categories.sort();
    update();
  }
}