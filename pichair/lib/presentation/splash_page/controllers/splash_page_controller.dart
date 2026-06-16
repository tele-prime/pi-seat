import 'package:pichair/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashPageController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1), () => Get.toNamed(AppRoutes.homeMenu));
  }
}