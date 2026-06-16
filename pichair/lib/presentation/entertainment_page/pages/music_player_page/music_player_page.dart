import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/presentation/entertainment_page/pages/music_player_page/controller/music_player_page_controller.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicPlayerPageController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Center(
                child: controller.isInitialized
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.music_note,
                            size: 120,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            controller.filePath?.split('/').last ?? 'Unknown',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      )
                    : const CircularProgressIndicator(),
              ),
              GestureDetector(
                onTap: controller.togglePlayPause,
                behavior: HitTestBehavior.translucent,
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: double.infinity,
                  child: const Center(
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 64,
                          ),
                        ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
