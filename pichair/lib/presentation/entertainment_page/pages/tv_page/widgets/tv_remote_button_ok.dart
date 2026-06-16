import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:pichair/app/theme/style_theme.dart';

class TvRemoteButtonOk extends StatelessWidget {
  final IconData icon;
  final NeumorphicButtonClickListener onPressed;

  const TvRemoteButtonOk({
    super.key,
    required this.icon,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPressed,
      style: SssStyleTheme().getMenu(radius: 10),
      padding: const EdgeInsets.all(10.0),
      child: Icon(
        icon,
        size: 30,
      ),
    );
  }
}
