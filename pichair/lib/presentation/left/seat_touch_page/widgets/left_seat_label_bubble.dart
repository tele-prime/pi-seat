import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:pichair/app/theme/style_theme.dart';

class LeftSeatLabelBubble extends StatelessWidget {
  
  final String label;
  
  const LeftSeatLabelBubble({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 40,
      child: Neumorphic(
        style: SssStyleTheme().getMenu(radius: 15),
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
