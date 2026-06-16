import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';

class RemotePadPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF455A64) // Medium blue-grey
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = NeumorphicTheme.currentTheme(Get.context!).baseColor
      ..strokeWidth = 2.0;

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    canvas.drawLine(const Offset(0, 0), Offset(size.width, size.height), linePaint);
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}