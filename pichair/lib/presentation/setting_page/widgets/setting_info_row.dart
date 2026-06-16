import 'package:flutter/material.dart';

class SettingInfoRow extends StatelessWidget {

  final String label;
  final String value;

  const SettingInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: TextStyle(
            fontSize: 14
        )),
        Expanded(child: SizedBox()),
        Text(value, style: TextStyle(
            fontSize: 14
        )),
      ],
    );
  }
}
