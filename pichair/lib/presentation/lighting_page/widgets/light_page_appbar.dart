import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/lighting_page/controller/lighting_page_controller.dart';

class LightPageAppbar extends StatelessWidget {
  const LightPageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LightingPageController>(builder: (controller) => Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: 50,
        height: 50,
        child: NeumorphicButton(
          onPressed: () => Get.back(),
          style: SssStyleTheme().getMenu(radius: 10),
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          child: Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: Icon(Icons.home, size: 20),
            ),
          ),
        ),
      ),
      // child: SizedBox(
      //   height: 50,
      //   width: Get.width,
      //   child: Row(
      //     children: [
      //       NeumorphicButton(
      //         onPressed: () => Get.back(),
      //         style: SssStyleTheme().getMenu(radius: 10),
      //         padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      //         child: Center(
      //           child: SizedBox(
      //             width: 50,
      //             height: 50,
      //             child: Icon(Icons.home, size: 20),
      //           ),
      //         ),
      //       ),
      //       Expanded(child: SizedBox()),
      //       // NeumorphicButton(
      //       //   onPressed: (){
      //       //     controller.scaffoldKey.currentState?.openEndDrawer();
      //       //   },
      //       //   padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      //       //   style: SssStyleTheme().getMenu(radius: Get.height/40),
      //       //   child: Center(
      //       //     child: SizedBox(
      //       //       width: 50,
      //       //       height: 50,
      //       //       child: Icon(Icons.menu, size: 20),
      //       //       // child: Icon(Icons.lightbulb, color: controller.testing ? SssColor.green : SssColor.red, size: 20,),
      //       //     ),
      //       //   ),
      //       // ),
      //       SizedBox(
      //         width: 20,
      //       ),
      //     ],
      //   ),
      // ),
    ));
  }
}
