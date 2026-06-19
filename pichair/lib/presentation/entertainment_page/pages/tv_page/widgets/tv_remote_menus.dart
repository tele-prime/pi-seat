import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_android_controller.dart';

class TvRemoteMenus extends StatelessWidget {
  const TvRemoteMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TvPageAndroidController>(builder: (controller) => Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: 60,
        height: Get.height,
        child: Column(
          children: [
            SizedBox(
              width: 60,
              height: 120,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: SizedBox()),
                      NeumorphicButton(
                        onPressed: controller.volumeUp,
                        style: SssStyleTheme().getVolumeUp(radius: 10),
                        padding: EdgeInsets.only(
                            top: 1,
                            bottom: 0,
                            right: 1,
                            left: 1
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.add, size: 20),
                          ),
                        ),
                      ),
                      NeumorphicButton(
                        onPressed: controller.volumeDown,
                        style: SssStyleTheme().getVolumeDown(radius: 10),
                        padding: EdgeInsets.only(
                            left: 1,
                            top: 0,
                            bottom: 1,
                            right: 1
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.remove, size: 20),
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                  Center(child: Icon(Icons.volume_up),)
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NeumorphicButton(
                  onPressed: controller.pressBack,
                  style: SssStyleTheme().getMenu(radius: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                  child: Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.undo_outlined, size: 20),
                    ),
                  ),
                ),
                SizedBox(height: 7),
                NeumorphicButton(
                  onPressed: controller.pressHome,
                  style: SssStyleTheme().getMenu(radius: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                  child: Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Stack(
                        children: [
                          Center(child: Icon(Icons.tv_outlined, size: 25)),
                          Center(child: Icon(Icons.home, size: 13))
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    ),);
  }
}
