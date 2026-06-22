import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_android_controller.dart';


class MusicPlayerDialog extends StatelessWidget {
  MusicPlayerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TvPageAndroidController>(
      builder: (controller) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Container(
            width: 400,
            constraints: BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFFDF8F0),
                  Color(0xFFF5EDE0),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF8B7355).withOpacity(0.15),
                  blurRadius: 30,
                  offset: Offset(0, 10),
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(24, 20, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF8E7),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0xFFE8DCC8),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD4A574),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Now Playing',
                                style: TextStyle(
                                  color: Color(0xFF8B7355),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              controller.stopAndCloseDialog();
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFF8E7),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color(0xFFE8DCC8),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.close_rounded,
                                color: Color(0xFF8B7355),
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        Text(
                          'တရံရောအခါ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3D3229),
                            letterSpacing: 0.3,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'ကြည်ကြည်ဌေး',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF9E8E7D),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      children: [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Color(0xFFD4A574),
                            inactiveTrackColor: Color(0xFFE8DCC8),
                            thumbColor: Color(0xFFFFFFFF),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 8,
                              elevation: 4,
                            ),
                            overlayColor: Color(0xFFD4A574).withOpacity(0.2),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 16),
                            trackHeight: 4,
                          ),
                          child: Slider(
                            value: 0.5.clamp(0.0, 1.0),
                            onChanged: (value) {

                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 4),

                  // Control Buttons
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Previous button
                        MusicDialogControlButton(
                          icon: Icons.skip_previous_rounded,
                          onTap: () {
                            if (controller.currentIndex > 0) {

                            }
                          },
                          size: 18,
                        ),
                        SizedBox(width: 12),
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFD4A574),
                                  Color(0xFFC49464),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(36),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFD4A574).withOpacity(0.3),
                                  blurRadius: 15,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Icon(
                              controller.isPlaying
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 27,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        // Next button
                        MusicDialogControlButton(
                          icon: Icons.skip_next_rounded,
                          onTap: () {

                          },
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MusicDialogControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;

  MusicDialogControlButton({
    required this.icon,
    required this.onTap,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Color(0xFFFFF8E7),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: Color(0xFFE8DCC8),
              width: 1.5,
            ),
          ),
          child: Icon(
            icon,
            color: Color(0xFF8B7355),
            size: size,
          ),
        ),
      ),
    );
  }
}
