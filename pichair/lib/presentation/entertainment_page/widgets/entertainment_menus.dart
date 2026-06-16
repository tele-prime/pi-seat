import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/constants/app_constant.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/routes/app_routes.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/entertainment_page/controller/entertainment_page_controller.dart';
import 'package:pichair/presentation/entertainment_page/widgets/entertainment_menu_tv_widget.dart';
import 'package:pichair/presentation/entertainment_page/widgets/entertainment_menu_widget.dart';
import 'package:pichair/presentation/entertainment_page/widgets/entertainment_setting_widget.dart';
import 'package:pichair/presentation/entertainment_page/widgets/entertainment_tablet_widget.dart';

class EntertainmentMenus extends StatelessWidget {
  const EntertainmentMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EntertainmentPageController>(
      builder: (controller) => NeumorphicTheme(
        themeMode: currentThemeMode.value,
        darkTheme: NeumorphicThemeData.dark(
          shadowLightColor: SssColor.grey.withAlpha(140),
        ),
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(height: 10),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 60),
                        EntertainmentMenuWidget(
                          onPressed: () => Get.toNamed(AppRoutes.entertainmentTv),
                          icon: 'tv',
                          label: 'TV',
                          isLoading: TvConnection.connected,
                          isAvailable: true,
                        ),
                        SizedBox(width: AppConstant.entertainmentGap),
                        EntertainmentTabletWidget(
                          onPressed: () {
                            if(controller.isScanningTv == TvConnection.connected){
                              controller.launch('com.fise.preview');
                            }
                          },
                          color: SssColor.white,
                          icon: (controller.isScanningTv == TvConnection.connected) ? 'tablet' : '',
                          label: (controller.isScanningTv == TvConnection.connected) ? 'TABLET' : 'Disconnected',
                          isLoading: controller.isScanningTv,
                        ),
                        SizedBox(width: AppConstant.entertainmentGap),
                        EntertainmentMenuTvWidget(
                          onPressed: () {
                            if(controller.isScanningTv == TvConnection.connected){
                              controller.launch('org.videolan.vlc');
                              Future.delayed(Duration(seconds: 1), () => Get.toNamed(AppRoutes.entertainmentTv));
                            }
                          },
                          color: SssColor.white,
                          icon: (controller.isScanningTv == TvConnection.connected) ? 'vlc' : '',
                          label: (controller.isScanningTv == TvConnection.connected) ? 'VLC' : 'Disconnected',
                          isLoading: controller.isScanningTv,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: SizedBox()),
                        EntertainmentMenuTvWidget(
                          onPressed: () {
                            if(controller.isScanningTv == TvConnection.connected){
                              controller.launch('com.xample.airnavigation');
                              Future.delayed(Duration(seconds: 1), () => Get.toNamed(AppRoutes.entertainmentTv));
                            }
                          },
                          color: SssColor.navi,
                          icon: (controller.isScanningTv == TvConnection.connected) ? 'navigation' : '',
                          label: (controller.isScanningTv == TvConnection.connected) ? 'NAVIGATION' : 'Disconnected',
                          isLoading: controller.isScanningTv,
                        ),
                        SizedBox(width: AppConstant.entertainmentGap),
                        EntertainmentMenuTvWidget(
                          onPressed: () {
                            if(controller.isScanningTv == TvConnection.connected){
                              controller.launch('app.organicmaps');
                              Future.delayed(Duration(seconds: 1), () => Get.toNamed(AppRoutes.entertainmentTv));
                            }
                          },
                          color: SssColor.white,
                          icon: (controller.isScanningTv == TvConnection.connected) ? 'organic' : '',
                          label: (controller.isScanningTv == TvConnection.connected) ? 'MAPS' : 'Disconnected',
                          isLoading: controller.isScanningTv,
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50, child: EntertainmentSettingWidget(
                onPressed: (){
                  if(controller.isScanningTv == TvConnection.connected){
                    controller.openSettings();
                    Future.delayed(Duration(seconds: 1), () => Get.toNamed(AppRoutes.entertainmentTv));
                  }
                },
              )),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
