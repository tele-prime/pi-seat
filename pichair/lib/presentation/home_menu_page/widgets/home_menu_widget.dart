import 'dart:ui';

import 'package:flutter_glow/flutter_glow.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeMenuWidget extends StatelessWidget {

  final String icon;
  final bool isScanning;
  final bool isConnected;
  final NeumorphicButtonClickListener onPressed;
  final NeumorphicButtonClickListener onLongPressed;

  const HomeMenuWidget({
    super.key,
    required this.onPressed,
    required this.onLongPressed,
    required this.icon,
    required this.isScanning,
    this.isConnected = true,
  });

  @override
  Widget build(BuildContext context) {
    double width = Get.width/3.6;
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        onLongPress: onLongPressed,
        child: SizedBox(
          width: width,
          child: AspectRatio(
            aspectRatio: 0.9,
            child: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image(
                      image: ExactAssetImage('assets/icons/icon_shadow.png'),
                      fit: BoxFit.contain,
                    )),
                Positioned.fill(child: Image(
                  image: ExactAssetImage('assets/icons/icon_$icon.png'),
                  fit: BoxFit.contain,
                  color: isConnected ? null : SssColor.white,
                )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ClipPath(
                      clipper: const ShapeBorderClipper(shape: StadiumBorder()),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0), // Adjust blur intensity
                        child: Container(
                          // Padding determines the overall size around the text
                          padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                          decoration: ShapeDecoration(
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: Colors.white.withOpacity(0.2), // Light border for reflection
                                width: 1.5,
                              ),
                            ),
                            // The semi-transparent tint of the glass
                            color: Colors.white.withOpacity(0.1),
                          ),
                          // Center the text inside the container
                          child: Center(
                            child: GlowText(icon.toUpperCase(), style: TextStyle(
                              color: SssColor.darkScaffoldBackground,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
