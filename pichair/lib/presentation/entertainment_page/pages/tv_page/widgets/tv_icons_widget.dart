import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_android_controller.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/widgets/tv_icons.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class TvIconsWidget extends StatelessWidget {

  final Function onMovieIconClick;
  final Function onMusicIconClick;

  const TvIconsWidget({super.key, required this.onMovieIconClick, required this.onMusicIconClick});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TvPageAndroidController>(builder: (controller) => Padding(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 12,
        right: 12
      ),
      child: SizedBox(
        width: 90,
        height: Get.height,
          // child: switch (controller.isScanningTv){
          //   TvConnection.disconnected => ListView(
          //     children: [
          //       AspectRatio(
          //         aspectRatio: 1,
          //         child: NeumorphicButton(
          //           onPressed: controller.scanToTvIp,
          //           style: SssStyleTheme().getMenu(radius: 10),
          //           padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          //           child: Center(
          //             child: Icon(Icons.refresh),
          //           ),
          //         ),
          //       ),
          //       SizedBox(height: 10),
          //       Text('RECONNECT', style: TextStyle(
          //         fontSize: 12,
          //       ),)
          //     ],
          //   ),
          //   TvConnection.scanning => ListView.separated(
          //       itemBuilder: (c,i) => AspectRatio(
          //         aspectRatio: 1,
          //         child: Shimmer(child: Container(
          //           color: Colors.grey,
          //         )),
          //       ),
          //       separatorBuilder: (c,i) => SizedBox(height: 5),
          //       itemCount: controller.tvIconList.length
          //   ),
          //   TvConnection.connected => ListView.separated(
          //     itemBuilder: (c,i) => TvIcons(
          //       package: controller.tvIconList[i]['package'],
          //       icon: controller.tvIconList[i]['icon'],
          //       onIconPress: switch(controller.tvIconList[i]['icon']) {
          //         'movie' => onMovieIconClick,
          //         'music' => onMusicIconClick,
          //         _ => () => controller.launch(controller.tvIconList[i]['package']),
          //       },
          //     ),
          //     separatorBuilder: (c,i) => SizedBox(height: 5),
          //     itemCount: controller.tvIconList.length,
          //   ),
          // }
        // child: ListView.separated(
        //   itemBuilder: (c,i) => TvIcons(
        //     package: controller.tvIconList[i]['package'],
        //     icon: controller.tvIconList[i]['icon'],
        //     onIconPress: switch(controller.tvIconList[i]['icon']) {
        //       'movie' => onMovieIconClick,
        //       'music' => onMusicIconClick,
        //       _ => () => controller.launch(controller.tvIconList[i]['package']),
        //     },
        //   ),
        //   separatorBuilder: (c,i) => SizedBox(height: 5),
        //   itemCount: controller.tvIconList.length,
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(controller.tvIconList.length, (i) => SizedBox(
            width: 120,
            height: 110,
            child: TvIcons(
                package: controller.tvIconList[i]['package'],
                icon: controller.tvIconList[i]['icon'],
                onIconPress: switch(controller.tvIconList[i]['icon']) {
                  'movie' => onMovieIconClick,
                  'music' => onMusicIconClick,
                  _ => () => controller.launch(controller.tvIconList[i]['package']),
                },
            ),
          )),
        ),
      ),
    ),);
  }
}
