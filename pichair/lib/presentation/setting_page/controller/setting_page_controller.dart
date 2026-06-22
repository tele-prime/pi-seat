import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:pichair/app/models/wifi_network.dart';
import 'package:pichair/app/service/linux_wifi_service.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/service/sss_service.dart';
import 'package:pichair/presentation/home_page/controllers/home_page_controller.dart';
import 'package:pichair/app/constants/app_constant.dart';
import 'package:pichair/app/models/version_model.dart';
import 'package:pichair/app/network/api.dart';

class SettingPageController extends GetxController {

  SssService service = Get.find();
  ApiClient api = ApiClient();
  VersionModel? latestVersion;

  VersionModel currentVersion = VersionModel(tagName: 'v1.0', name: 'current');
  bool updateAvailable = false;

  int menuIndex = 1;
  double menuWidth = 130;
  bool showLabelStatus = false;

  final info = NetworkInfo();
  String? wifiIp;
  String? wifiName;

  String languageCode = 'en';
  int currentPosition = 0;
  int currentSelectedDesignPosition = 0;

  List<String> layoutNameList = [
    'setting_menu_config',
    'setting_menu_info',
    'setting_menu_locale',
  ];

  final LinuxWifiService wifiService = LinuxWifiService();
  List<WifiNetwork> networks = [];
  bool isLoading = true;
  WifiNetwork? connectedNetwork;

  @override
  void onInit() {
    super.onInit();
    fetchIp();
    fetchCurrentPosition();
    fetchCurrentLocale();
    fetchCurrentLayoutDesign();
    fetchLabelStatus();
    fetchVersion();
    refreshNetworks();
  }

  void changeMenuIndex(int? newIndex){
    if((newIndex??0) > 0){
      menuIndex = newIndex??0;
      update();
    }
  }

  void fetchIp() async {
    wifiIp = await info.getWifiIP();
    wifiName = await info.getWifiName();
    update();
  }

  void fetchCurrentLocale() async {
    languageCode = (Get.locale??Locale('en')).languageCode;
    await Future.delayed(const Duration(milliseconds: 200), update);
  }

  void fetchCurrentPosition() async {
    currentPosition = currentTouchScreenPosition.value;
  }

  void changeThemeMode() async {
    if(currentThemeMode.value == ThemeMode.dark){
      service.saveThemeMode(ThemeMode.light);
    }else{
      service.saveThemeMode(ThemeMode.dark);
    }
    await Future.delayed(const Duration(milliseconds: 300), update);
    HomePageController homePageController = Get.find();
    homePageController.update();
  }

  void changeThemeModeToggle(bool current) async {
    if(current){
      service.saveThemeMode(ThemeMode.light);
    }else{
      service.saveThemeMode(ThemeMode.dark);
    }
    await Future.delayed(const Duration(milliseconds: 300), update);
    HomePageController homePageController = Get.find();
    homePageController.update();
  }

  void changeLocale(String? localeString) async {
    Locale newLocale = {
      'en' : Locale('en', 'US'),
      'my' : Locale('my', 'MM'),
      // 2 : Locale('ja', 'JP'),
      // 3 : Locale('ko', 'KR'),
      null : Locale('en', 'US'),
    }[localeString]!;
    service.saveLocale(newLocale);
    fetchCurrentLocale();
  }

  void changePosition(int? newPosition) async {
    service.savePosition(newPosition??0);
    currentPosition = newPosition??0;
    update();
  }

  void changeSwitch(bool status) async {
    if(currentThemeMode.value == ThemeMode.dark){
      service.saveThemeMode(ThemeMode.light);
    }else{
      service.saveThemeMode(ThemeMode.dark);
    }
    await Future.delayed(const Duration(milliseconds: 300), update);
    HomePageController homePageController = Get.find();
    homePageController.update();
  }

  void fetchCurrentLayoutDesign() {
    currentSelectedDesignPosition = currentLayoutDesign.value;
    Future.delayed(Duration(milliseconds: 100), update);
  }

  void changeLayoutDesign(int? position){
    service.saveDesign(position??0);
    Future.delayed(Duration(milliseconds: 100), fetchCurrentLayoutDesign);
  }

  void fetchLabelStatus() async {
    showLabelStatus = currentLabelAvailability.value;
    Future.delayed(Duration(milliseconds: 100), update);
  }

  void changeLabelStatus(bool status) async {
    service.saveLabelAvailability(status);
    Future.delayed(Duration(milliseconds: 100), fetchLabelStatus);
  }

  void fetchVersion() async {
    try {
      final response = await api.getFullUrl(AppConstant.versionApiBaseUrl);
      if (response.statusCode == 200 && response.body != null) {
        latestVersion = VersionModel.fromJson(response.body);
      } else {
        latestVersion = currentVersion;
      }
      if(latestVersion!.tagName != currentVersion.tagName){
        print('#### Latest version ${latestVersion?.tagName??'unknown'}');
        double apiVersionNumber = double.parse(latestVersion!.tagName.replaceAll('v', ''));
        double currentVersionNumber = double.parse(currentVersion.tagName.replaceAll('v', ''));
        if(apiVersionNumber > currentVersionNumber){
          updateAvailable = true;
        }
      }
    } catch (e) {
      latestVersion = currentVersion;
    } finally {
      update();
    }
  }

  void forceUpdate() async {
    await Process.start(
      'sudo',
      ['/home/aye/project/updater.sh'],
      mode: ProcessStartMode.detached,
    );
  }

  Future<void> refreshNetworks() async {
    isLoading = true;
    update();
    final scanNetworks = await wifiService.scanNetworks();
    networks = scanNetworks;
    print('#### scanned wifi networks ${networks.length}');
    try {
      connectedNetwork = scanNetworks.firstWhere((n) => n.isConnected);
    } catch (e) {
      connectedNetwork = null;
    }
    isLoading = false;
    print('connected:${connectedNetwork != null}, available:${networks.length}');
    update();
  }

  Future<void> handleConnect(WifiNetwork newNetwork, String? password) async {
    bool success = await wifiService.connectToNetwork(newNetwork.ssid, password);

    if (success) {
      Get.snackbar('Great', 'Connection successfully!');
      connectedNetwork = newNetwork;
      networks = [];
      refreshNetworks();
    } else {
      Get.snackbar('Warning', 'Failed to connect');
    }
  }

  Future<void> handleDisconnect(WifiNetwork currentNetwork) async {
    bool success = await wifiService.disconnectNetwork(currentNetwork.ssid);
    if (success) {
      connectedNetwork = null;
      refreshNetworks();
    }
  }
}
