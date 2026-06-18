import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_android_controller.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/widgets/tv_remote_button.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/widgets/tv_remote_button_ok.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/widgets/tv_remote_menus.dart';

class TvLayoutRemoteControl extends StatelessWidget {

  const TvLayoutRemoteControl({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TvPageAndroidController>(builder: (controller) => Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Expanded(child: SizedBox()),
                  TvRemoteButton(
                      icon: Icons.keyboard_arrow_up,
                    onPressed: controller.arrowUp
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TvRemoteButton(
                          icon: Icons.keyboard_arrow_left,
                          onPressed: controller.arrowLeft
                      ),
                      SizedBox(width: 20),
                      TvRemoteButtonOk(
                          icon: Icons.circle,
                          onPressed: controller.pressOk
                      ),
                      SizedBox(width: 20),
                      TvRemoteButton(
                        icon: Icons.keyboard_arrow_right,
                        onPressed: controller.arrowRight,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TvRemoteButton(
                    icon: Icons.keyboard_arrow_down,
                    onPressed: controller.arrowDown,
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NeumorphicButton(
                        onPressed: controller.previous,
                        style: SssStyleTheme().getMenu(radius: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                        child: Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.skip_previous, size: 20),
                          ),
                        ),
                      ),
                      SizedBox(width: 7),
                      NeumorphicButton(
                        onPressed: controller.stop,
                        style: SssStyleTheme().getMenu(radius: 10),
                        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                        child: Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.stop, size: 20),
                          ),
                        ),
                      ),
                      SizedBox(width: 7),
                      NeumorphicButton(
                        onPressed: controller.play,
                        style: SssStyleTheme().getMenu(radius: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                        child: Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.play_arrow, size: 20),
                          ),
                        ),
                      ),
                      SizedBox(width: 7),
                      NeumorphicButton(
                        onPressed: controller.next,
                        style: SssStyleTheme().getMenu(radius: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                        child: Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.skip_next, size: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
          TvRemoteMenus()
        ],
      ),
    ));
  }
}

