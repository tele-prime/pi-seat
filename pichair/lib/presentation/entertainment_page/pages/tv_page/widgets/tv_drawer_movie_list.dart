import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_android_controller.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

class TvDrawerMovieList extends StatelessWidget {
  const TvDrawerMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TvPageAndroidController>(builder: (controller) => ScrollableListTabScroller.defaultComponents(
      headerContainerProps: HeaderContainerProps(height: 50),
      tabBarProps: TabBarProps(dividerColor: Colors.red.withOpacity(0.3)),
      itemCount: controller.homeMenuPageController.categories.length + 1,
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
              index == 0 ? 'All' : controller.homeMenuPageController.categories[index - 1],
              style: const TextStyle(color: SssColor.white, fontWeight: FontWeight.bold),
            ),
          ),
        ) : Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              index == 0 ? 'All' : controller.homeMenuPageController.categories[index - 1],
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
                'All',
                style: TextStyle(color: SssColor.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          MovieListWidget(
            movieList: controller.homeMenuPageController.movieFiles,
            onPlay: (uri) => controller.playMovie(uri),
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
                controller.homeMenuPageController.categories[index - 1],
                style: const TextStyle(color: SssColor.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          MovieListWidget(
            movieList: controller.homeMenuPageController.categorizedMovie[
            controller.homeMenuPageController.categories[index - 1]] ??
                [],
            onPlay: (uri) => controller.playMovie(uri),
          ),
        ],
      ),
    ));
  }
}

class MovieListWidget extends StatelessWidget {

  final List<Map<String, String>> movieList;
  final Function(String) onPlay;

  const MovieListWidget({super.key, required this.movieList, required this.onPlay});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movieList.length,
      itemBuilder: (c, i) => ListTile(
        title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
                border: Border.all(color: SssColor.black.withOpacity(0.12)),
                borderRadius: BorderRadius.circular(8),
                color: Colors.black12
            ),
            child: Text(
              movieList[i]['name'] ?? '',
              style: const TextStyle(color: SssColor.black),
            )
        ),
        onTap: () {
          Get.close(1);
          onPlay(movieList[i]['uri']!);
        },
      ),
    );
  }
}

