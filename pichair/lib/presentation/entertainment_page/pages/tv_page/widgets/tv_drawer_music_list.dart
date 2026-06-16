import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_android_controller.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';


class TvDrawerMusicList extends StatefulWidget {

  const TvDrawerMusicList({super.key});

  @override
  State<TvDrawerMusicList> createState() => _TvDrawerMusicListState();
}

class _TvDrawerMusicListState extends State<TvDrawerMusicList> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TvPageAndroidController>(builder: (controller) => ScrollableListTabScroller.defaultComponents(
      headerContainerProps: HeaderContainerProps(height: 50),
      tabBarProps: TabBarProps(dividerColor: Colors.red.withOpacity(0.3)),
      itemCount: controller.homeMenuPageController.artists.length + 1,
      earlyChangePositionOffset: 30,
      tabBuilder: (BuildContext context, int index, bool active) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: active ? Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: SssColor.yellow,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
            color: SssColor.blueGrey
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Center(
            child: Text(
              index == 0 ? 'သီချင်းများ' : controller.homeMenuPageController.artists[index - 1],
              style: const TextStyle(color: SssColor.white, fontWeight: FontWeight.bold),
            ),
          ),
        ) : Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              index == 0 ? 'သီချင်းများ' : controller.homeMenuPageController.artists[index - 1],
              style: const TextStyle(color: SssColor.grey),
            ),
          ),
        ),
      ),
      itemBuilder: (BuildContext context, int index) => Column(
        children: index == 0 ? [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: SssColor.yellow,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
                color: SssColor.blueGrey
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: const Center(
              child: Text(
                'သီချင်းများ',
                style: TextStyle(color: SssColor.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          MusicListWidget(
            musicList: controller.homeMenuPageController.musicFiles,
            onPlay: (uri) => controller.playMusic(uri),
            cut: false,
          ),
        ] : [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: SssColor.yellow,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
                color: SssColor.blueGrey
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Center(
              child: Text(
                controller.homeMenuPageController.artists[index - 1],
                style: const TextStyle(color: SssColor.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          MusicListWidget(
            musicList: controller.homeMenuPageController.categorizedMusic[
                    controller.homeMenuPageController.artists[index - 1]] ??
                [],
            onPlay: (uri) => controller.playMusic(uri),
            cut: true,
          ),
        ],
      ),
    ));
  }
}

class MusicListWidget extends StatelessWidget {

  final List<Map<String, String>> musicList;
  final bool cut;
  final Function(String) onPlay;

  const MusicListWidget({super.key, required this.musicList, required this.onPlay, required this.cut});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: musicList.length,
      itemBuilder: (c, i) => ListTile(
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(8),
              color: Colors.black12
          ),
          child: Text(
            cut ?
            musicList[i]['name']!.substring(
              musicList[i]['name']!.indexOf(' '),
              musicList[i]['name']!.indexOf('('),
            ) : musicList[i]['name']!,
            style: TextStyle(color: SssColor.black),
          ),
        ),
        onTap: () {
          Get.close(1);
          onPlay(musicList[i]['uri']!);
        },
      ),
    );
  }
}
