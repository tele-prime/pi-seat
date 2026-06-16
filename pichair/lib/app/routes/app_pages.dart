import 'package:pichair/app/routes/app_routes.dart';
import 'package:pichair/presentation/home_menu_page/controllers/home_menu_page_controller.dart';
import 'package:pichair/presentation/home_menu_page/home_menu_page.dart';
import 'package:pichair/presentation/left/control_button_page/left_control_button_page.dart';
import 'package:pichair/presentation/left/control_button_page/controller/left_control_button_page_controller.dart';
import 'package:pichair/presentation/left/control_icon_page/left_control_icon_page.dart';
import 'package:pichair/presentation/left/control_icon_page/controller/left_control_icon_page_controller.dart';
import 'package:pichair/presentation/left/control_image_page/left_control_image_page.dart';
import 'package:pichair/presentation/left/control_image_page/controller/left_control_image_page_controller.dart';
import 'package:pichair/presentation/left/control_touch_page/left_control_touch_page.dart';
import 'package:pichair/presentation/left/control_touch_page/controllers/left_control_touch_page_controller.dart';
import 'package:pichair/presentation/entertainment_page/controller/entertainment_page_controller.dart';
import 'package:pichair/presentation/entertainment_page/entertainment_page.dart';
import 'package:pichair/presentation/entertainment_page/pages/movie_page/controller/movie_page_controller.dart';
import 'package:pichair/presentation/entertainment_page/pages/movie_page/movie_page.dart';
import 'package:pichair/presentation/entertainment_page/pages/movie_player_page/controller/movie_player_page_controller.dart';
import 'package:pichair/presentation/entertainment_page/pages/movie_player_page/movie_player_page.dart';
import 'package:pichair/presentation/entertainment_page/pages/music_page/controller/music_page_controller.dart';
import 'package:pichair/presentation/entertainment_page/pages/music_page/music_page.dart';
import 'package:pichair/presentation/entertainment_page/pages/music_player_page/controller/music_player_page_controller.dart';
import 'package:pichair/presentation/entertainment_page/pages/music_player_page/music_player_page.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_android_controller.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/tv_page.dart';
import 'package:pichair/presentation/home_page/controllers/home_page_controller.dart';
import 'package:pichair/presentation/home_page/home_page.dart';
import 'package:pichair/presentation/left/seat_touch_page/controllers/left_seat_touch_page_controller.dart';
import 'package:pichair/presentation/left/seat_touch_page/left_seat_touch_page.dart';
import 'package:pichair/presentation/lighting_page/controller/lighting_page_controller.dart';
import 'package:pichair/presentation/lighting_page/lighting_page.dart';
import 'package:pichair/presentation/right/control_button_page/controller/right_control_button_page_controller.dart';
import 'package:pichair/presentation/right/control_button_page/right_control_button_page.dart';
import 'package:pichair/presentation/right/control_icon_page/controller/right_control_icon_page_controller.dart';
import 'package:pichair/presentation/right/control_icon_page/right_control_icon_page.dart';
import 'package:pichair/presentation/right/control_image_page/controller/right_control_image_page_controller.dart';
import 'package:pichair/presentation/right/control_image_page/right_control_image_page.dart';
import 'package:pichair/presentation/right/control_touch_page/controllers/right_control_touch_page_controller.dart';
import 'package:pichair/presentation/right/control_touch_page/right_control_touch_page.dart';
import 'package:pichair/presentation/right/seat_touch_page/controllers/right_seat_touch_page_controller.dart';
import 'package:pichair/presentation/right/seat_touch_page/right_seat_touch_page.dart';
import 'package:pichair/presentation/setting_page/controller/setting_page_controller.dart';
import 'package:pichair/presentation/setting_page/setting_page.dart';
import 'package:pichair/presentation/splash_page/controllers/splash_page_controller.dart';
import 'package:pichair/presentation/splash_page/splash_page.dart';
import 'package:get/get.dart';
import 'package:pichair/presentation/user_manual_page/controller/user_manual_page_controller.dart';
import 'package:pichair/presentation/user_manual_page/user_manual_page.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => SplashPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => HomePageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.homeMenu,
      page: () => HomeMenuPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => HomeMenuPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.entertainment,
      page: () => EntertainmentPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => EntertainmentPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.userManual,
      page: () => UserManualPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => UserManualPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.lighting,
      page: () => LightingPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => LightingPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => SettingPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => SettingPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.leftSeatTouch,
      page: () => LeftSeatTouchPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => LeftSeatTouchPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.leftControlTouch,
      page: () => LeftControlTouchPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => LeftControlTouchPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.leftControlButton,
      page: () => LeftControlButtonPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => LeftControlButtonPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.leftControlIcon,
      page: () => LeftControlIconPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => LeftControlIconPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.leftControlImage,
      page: () => LeftControlImagePage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => LeftControlImagePageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.rightSeatTouch,
      page: () => RightSeatTouchPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => RightSeatTouchPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.rightControlTouch,
      page: () => RightControlTouchPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => RightControlTouchPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.rightControlButton,
      page: () => RightControlButtonPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => RightControlButtonPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.rightControlIcon,
      page: () => RightControlIconPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => RightControlIconPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.rightControlImage,
      page: () => RightControlImagePage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => RightControlImagePageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.entertainmentTv,
      page: () => TvPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => TvPageAndroidController())),
      ],
    ),
    GetPage(
      name: AppRoutes.entertainmentMovie,
      page: () => MoviePage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => MoviePageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.entertainmentMoviePlayer,
      page: () => MoviePlayerPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => MoviePlayerPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.entertainmentMusic,
      page: () => MusicPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => MusicPageController())),
      ],
    ),
    GetPage(
      name: AppRoutes.entertainmentMusicPlayer,
      page: () => MusicPlayerPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => MusicPlayerPageController())),
      ],
    ),
  ];
}
