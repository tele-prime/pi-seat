import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/routes/app_routes.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/home_menu_page/controllers/home_menu_page_controller.dart';
import 'package:pichair/presentation/home_menu_page/widgets/home_menu_widget.dart';
import 'package:pichair/presentation/home_menu_page/widgets/home_menu_setting_widget.dart';
import 'package:get/get.dart';

class HomeMenuPage extends StatelessWidget {
  const HomeMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeMenuPageController>(builder: (controller) => NeumorphicTheme(
      themeMode: currentThemeMode.value,
      darkTheme: NeumorphicThemeData.dark(
        shadowLightColor: SssColor.grey.withAlpha(140)
      ),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(child: Image(
              image: ExactAssetImage('assets/icons/sky_cloud.png'),
              fit: BoxFit.cover,
            )),
            Column(
              children: [
                SizedBox(height: 70),
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: SizedBox()),
                        HomeMenuWidget(
                          onPressed: () {
                            if(controller.tvIpAddress != null){
                              Get.toNamed(AppRoutes.entertainmentTv);
                            }
                          },
                          onLongPressed: (){
                            controller.resetConnection();
                          },
                          icon: 'entertainment',
                          isScanning: controller.isScanningTv == TvConnection.scanning,
                          isConnected: controller.tvIpAddress != null,
                        ),
                        SizedBox(width: 10),
                        HomeMenuWidget(
                          onLongPressed: (){},
                          onPressed: () {
                            switch (currentLayoutDesign.value) {
                              case 0:
                                if(currentTouchScreenPosition.value == 1){
                                  Get.toNamed(AppRoutes.rightSeatTouch);
                                }else{
                                  Get.toNamed(AppRoutes.leftSeatTouch);
                                }
                                break;
                              case 1:
                                if(currentTouchScreenPosition.value == 1){
                                  Get.toNamed(AppRoutes.rightSeatTouch);
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
                          },
                          icon: 'seat',
                          isScanning: false,
                          isConnected: true,
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50, child: HomeMenuSettingWidget()),
                SizedBox(height: 20),
              ],
            ),
          ],
        )
      )));
  }
}
