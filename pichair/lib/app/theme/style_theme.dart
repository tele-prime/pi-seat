import 'package:pichair/app/constants/app_constant.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class SssStyleTheme {

  static final ThemeData lightTheme = ThemeData(
    // primarySwatch: Colors.blue,
    brightness: Brightness.light,
    cardColor: SssColor.blackGrey,
    scaffoldBackgroundColor: SssColor.lightScaffoldBackground,
    highlightColor: SssColor.green,
    unselectedWidgetColor: SssColor.blackGrey,
    hoverColor: SssColor.darkScaffoldBackground,
    // appBarTheme: const AppBarTheme(backgroundColor: Colors.blueAccent),
    // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
    //   secondary: Colors.redAccent,
    //   background: const Color(0xFFF0F0F0),
    // ),
    // cardColor: Colors.white,
    // textTheme: const TextTheme(
    //   bodyMedium: TextStyle(color: Colors.black87),
    // ),
    fontFamily: 'Pyidaungsu'
  );

  static final ThemeData darkTheme = ThemeData(
    // primarySwatch: Colors.indigo,
    brightness: Brightness.dark,
    cardColor: SssColor.whiteGrey,
      scaffoldBackgroundColor: SssColor.darkScaffoldBackground,
    highlightColor: SssColor.yellow,
    unselectedWidgetColor: SssColor.whiteGrey,
      hoverColor: SssColor.lightScaffoldBackground,
    // appBarTheme: const AppBarTheme(backgroundColor: Colors.indigo),
    // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo, brightness: Brightness.dark).copyWith(
    //   secondary: Colors.tealAccent,
    //   background: const Color(0xFF121212),
    // ),
    // cardColor: const Color(0xFF1E1E1E),
    // textTheme: const TextTheme(
    //   bodyMedium: TextStyle(color: Colors.white70),
    // ),
    fontFamily: 'Pyidaungsu'
  );

  static NeumorphicStyle homeMenu = NeumorphicStyle(
      shape: NeumorphicShape.concave,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      intensity: 1,
      depth: 3,
      lightSource: LightSource.topLeft,
  );

  NeumorphicStyle getMenu({double? radius}) => NeumorphicStyle(
    shape: NeumorphicShape.concave,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(radius??AppConstant.buttonRadius)),
    intensity: 1,
    depth: 3,
    lightSource: LightSource.topLeft,
  );

  NeumorphicStyle getVolumeDown({double? radius}) => NeumorphicStyle(
    shape: NeumorphicShape.flat,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius
      .only(
        topLeft: Radius.zero,
        topRight: Radius.zero,
        bottomLeft: Radius.circular(radius??AppConstant.buttonRadius),
        bottomRight: Radius.circular(radius??AppConstant.buttonRadius),
      )
    ),
    intensity: 1,
    depth: 3,
    lightSource: LightSource.topLeft,
  );

  NeumorphicStyle getVolumeUp({double? radius}) => NeumorphicStyle(
    shape: NeumorphicShape.flat,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius
        .only(
      topLeft: Radius.circular(radius??AppConstant.buttonRadius),
      topRight: Radius.circular(radius??AppConstant.buttonRadius),
      bottomLeft: Radius.zero,
      bottomRight: Radius.zero,
    )
    ),
    intensity: 1,
    depth: 3,
    lightSource: LightSource.topLeft,
  );

  NeumorphicStyle getIconMenu({double? radius, Color color = SssColor.white}) => NeumorphicStyle(
    shape: NeumorphicShape.concave,
    color: color,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(radius??AppConstant.buttonRadius)),
    intensity: 1,
    depth: 3,
    lightSource: LightSource.topLeft,
  );
}