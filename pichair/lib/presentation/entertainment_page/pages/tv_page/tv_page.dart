import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/enum/sss_enum.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_android_controller.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/layouts/tv_layout_remote_control.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/layouts/tv_layout_keyboard.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/widgets/tv_drawer_movie_list.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/widgets/tv_drawer_music_list.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/widgets/tv_icons_widget.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/widgets/tv_menus.dart';

class TvPage extends StatelessWidget {
  const TvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TvPageAndroidController>(builder: (controller) => NeumorphicTheme(
      themeMode: currentThemeMode.value,
      darkTheme: NeumorphicThemeData.dark(
        shadowLightColor: SssColor.grey.withAlpha(140),
      ),
      child: Scaffold(
        endDrawer: Drawer(
          width: 500,
          child: switch (controller.currentDrawer) {
            TvDrawer.movie => TvDrawerMovieList(),
            TvDrawer.music => TvDrawerMusicList(),
            TvDrawer.none => Container(color: Colors.black12)
          },
        ),
        body: Builder(
          builder: (context) {
            return Row(
              children: [
                TvMenus(),
                Expanded(child: {
                  TvLayout.remote : TvLayoutRemoteControl(),
                  TvLayout.keyboard : TvLayoutKeyboard(),
                }[controller.currentLayout]!),
                TvIconsWidget(
                  onMovieIconClick: () {
                    controller.currentDrawer = TvDrawer.movie;
                    controller.update();
                    Scaffold.of(context).openEndDrawer();
                  },
                  onMusicIconClick: () {
                    controller.currentDrawer = TvDrawer.music;
                    controller.update();
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            );
          }
        ),
      ),
    ));
  }
}
