import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/presentation/entertainment_page/pages/tv_page/controller/tv_page_android_controller.dart';


class MusicPlayerDialog extends StatelessWidget {
  const MusicPlayerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TvPageAndroidController>(
      builder: (controller) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Container(
            width: 400,
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFFFFFF),      // Pure white
                  Color(0xFFFDF8F0),      // Warm milk white
                  Color(0xFFF5EDE0),      // Light milk cream
                ],
                stops: [0.0, 0.5, 1.0],
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF8B7355).withOpacity(0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Top bar with close button
                  Container(
                    padding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Now Playing label
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF8E7),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFE8DCC8),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFD4A574),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
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
                        // Close button - stops music and closes dialog
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              controller.stopAndCloseDialog();
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF8E7),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(0xFFE8DCC8),
                                  width: 1,
                                ),
                              ),
                              child: const Icon(
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

                  // const SizedBox(height: 32),

                  // Album Art Area
                  // Container(
                  //   width: 50,
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //     gradient: const LinearGradient(
                  //       begin: Alignment.topLeft,
                  //       end: Alignment.bottomRight,
                  //       colors: [
                  //         Color(0xFFFFF8E7),
                  //         Color(0xFFF5E6D3),
                  //         Color(0xFFE8D4C0),
                  //       ],
                  //     ),
                  //     borderRadius: BorderRadius.circular(24),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: const Color(0xFFD4A574).withOpacity(0.2),
                  //         blurRadius: 20,
                  //         offset: const Offset(0, 8),
                  //       ),
                  //     ],
                  //   ),
                  //   child: Center(
                  //     child: Icon(
                  //       controller.isPlaying
                  //           ? Icons.music_note
                  //           : Icons.music_note_outlined,
                  //       size: 64,
                  //       color: const Color(0xFFD4A574),
                  //     ),
                  //   ),
                  // ),

                  const SizedBox(height: 32),

                  // Song Info
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        Text(
                          'တရံရောအခါ',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3D3229),
                            letterSpacing: 0.3,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'ကြည်ကြည်ဌေး',
                          style: const TextStyle(
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

                  // const SizedBox(height: 32),
                  //
                  // // Progress Bar
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 28),
                  //   child: Column(
                  //     children: [
                  //       SliderTheme(
                  //         data: SliderTheme.of(context).copyWith(
                  //           activeTrackColor: const Color(0xFFD4A574),
                  //           inactiveTrackColor: const Color(0xFFE8DCC8),
                  //           thumbColor: const Color(0xFFFFFFFF),
                  //           thumbShape: const RoundSliderThumbShape(
                  //             enabledThumbRadius: 8,
                  //             elevation: 4,
                  //           ),
                  //           overlayColor: const Color(0xFFD4A574).withOpacity(0.2),
                  //           overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                  //           trackHeight: 4,
                  //         ),
                  //         child: Slider(
                  //           value: 0.5.clamp(0.0, 1.0),
                  //           onChanged: (value) {
                  //             // controller.seekTo(value);
                  //           },
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 12),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               'Current Position by Tele',
                  //               style: const TextStyle(
                  //                 color: Color(0xFF9E8E7D),
                  //                 fontSize: 12,
                  //                 fontWeight: FontWeight.w500,
                  //               ),
                  //             ),
                  //             Text(
                  //               'Total Duration by Tele',
                  //               style: const TextStyle(
                  //                 color: Color(0xFF9E8E7D),
                  //                 fontSize: 12,
                  //                 fontWeight: FontWeight.w500,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  const SizedBox(height: 24),

                  // Control Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Previous button
                        MusicDialogControlButton(
                          icon: Icons.skip_previous_rounded,
                          onTap: () {
                            if (controller.currentIndex > 0) {
                              // controller.playSong(controller.currentIndex - 1);
                            }
                          },
                          size: 28,
                        ),
                        const SizedBox(width: 24),
                        // Play/Pause button
                        GestureDetector(
                          onTap: (){},
                          // onTap: controller.togglePlayPause,
                          child: Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
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
                                  color: const Color(0xFFD4A574).withOpacity(0.3),
                                  blurRadius: 15,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Icon(
                              controller.isPlaying
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                        // Next button
                        MusicDialogControlButton(
                          icon: Icons.skip_next_rounded,
                          onTap: () {
                            // if (controller.currentIndex < controller.musicList.length - 1) {
                            //   controller.playSong(controller.currentIndex + 1);
                            // }
                          },
                          size: 28,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 36),
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

  const MusicDialogControlButton({
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
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF8E7),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: const Color(0xFFE8DCC8),
              width: 1.5,
            ),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF8B7355),
            size: size,
          ),
        ),
      ),
    );
  }
}
