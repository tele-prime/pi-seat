import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/theme/style_theme.dart';
import 'package:pichair/presentation/entertainment_page/controller/entertainment_page_controller.dart';

class EntertainmentAppbar extends StatelessWidget {
  const EntertainmentAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EntertainmentPageController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          width: Get.width,
          height: 50,
          child: Row(
            children: [
              NeumorphicButton(
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
              Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
