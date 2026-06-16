import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:pichair/app/routes/app_routes.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/home_page/controllers/home_page_controller.dart';
import 'package:pichair/presentation/home_page/widgets/home_menu_widget.dart';
import 'package:pichair/presentation/home_page/widgets/home_bulb_widget.dart';
import 'package:pichair/presentation/home_page/widgets/home_setting_widget.dart';
import 'package:pichair/presentation/home_page/widgets/home_tv_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) => NeumorphicTheme(
      themeMode: currentThemeMode.value,
      darkTheme: NeumorphicThemeData.dark(
        shadowLightColor: SssColor.grey.withAlpha(140)
      ),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 200
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/eagle.jpg',
                  fit: BoxFit.cover,
                  opacity: AlwaysStoppedAnimation(.4),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 70),
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HomeTvWidget(
                            onPressed: () => Get.toNamed(AppRoutes.entertainment),
                            icon: 'tv',
                            isActive: true
                        ),
                        HomeMenuWidget(onPressed: () {
                          switch (currentLayoutDesign.value) {
                            case 0:
                              if(currentTouchScreenPosition.value == 1){
                                Get.toNamed(AppRoutes.rightControlTouch);
                                // Get.toNamed(AppRoutes.rightSeatTouch);
                              }else{
                                Get.toNamed(AppRoutes.leftSeatTouch);
                              }
                              break;
                            case 1:
                              if(currentTouchScreenPosition.value == 1){
                                Get.toNamed(AppRoutes.rightControlTouch);
                                // Get.toNamed(AppRoutes.rightSeatTouch);
                              }else{
                                Get.toNamed(AppRoutes.leftSeatTouch);
                              }
                              break;
                            case 2:
                              if(currentTouchScreenPosition.value == 1){
                                Get.toNamed(AppRoutes.rightControlButton);
                              }else{
                                Get.toNamed(AppRoutes.leftControlButton);
                              }
                              break;
                            case 3:
                              if(currentTouchScreenPosition.value == 1){
                                Get.toNamed(AppRoutes.rightControlIcon);
                              }else{
                                Get.toNamed(AppRoutes.leftControlIcon);
                              }
                              break;
                            case 4:
                              if(currentTouchScreenPosition.value == 1){
                                Get.toNamed(AppRoutes.rightControlImage);
                              }else{
                                Get.toNamed(AppRoutes.leftControlImage);
                              }
                              break;
                            default:
                              if(currentTouchScreenPosition.value == 1){
                                Get.toNamed(AppRoutes.rightControlTouch);
                              }else{
                                Get.toNamed(AppRoutes.leftSeatTouch);
                              }
                              break;
                          }
                        }, icon: 'chair'),
                        HomeBulbWidget(
                            onPressed: () => Get.toNamed(AppRoutes.lighting),
                            icon: 'light', isActive: true
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50, child: HomeSettingWidget()),
                SizedBox(height: 20),
              ],
            ),
          ],
        )
      )));
  }
}
