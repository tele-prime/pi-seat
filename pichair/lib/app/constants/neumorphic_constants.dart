
import 'package:pichair/app/theme/color_theme.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class SssStyleConstant {
  static NeumorphicStyle homeMenu = NeumorphicStyle(
      shape: NeumorphicShape.concave,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      depth: 8,
      lightSource: LightSource.topLeft,
      color: SssColor.primary
  );
}