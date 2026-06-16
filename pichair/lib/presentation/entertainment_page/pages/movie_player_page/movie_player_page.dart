import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:pichair/presentation/entertainment_page/pages/movie_player_page/controller/movie_player_page_controller.dart';

class MoviePlayerPage extends StatelessWidget {
  const MoviePlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviePlayerPageController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Center(
                child: controller.isInitialized
                    ? AspectRatio(
                        aspectRatio:
                            controller.videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(controller.videoPlayerController),
                      )
                    : const CircularProgressIndicator(),
              ),
              GestureDetector(
                onTap: controller.toggleControlsVisibility,
                onPanDown: (_) => controller.resetHideControlsTimer(),
                behavior: HitTestBehavior.translucent,
                child: AnimatedOpacity(
                  opacity: controller.areControlsVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                    width: double.infinity,
                    height: double.infinity,
                    child: controller.isInitialized
                        ? Column(
                            children: [
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.replay_10, color: Colors.white, size: 40),
                                    onPressed: controller.backward10Seconds,
                                  ),
                                  const SizedBox(width: 40),
                                  IconButton(
                                    icon: Icon(
                                      controller.videoPlayerController.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                      size: 64,
                                    ),
                                    onPressed: controller.togglePlayPause,
                                  ),
                                  const SizedBox(width: 40),
                                  IconButton(
                                    icon: const Icon(Icons.forward_10, color: Colors.white, size: 40),
                                    onPressed: controller.forward10Seconds,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              VideoProgressIndicator(
                                controller.videoPlayerController,
                                allowScrubbing: true,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                colors: const VideoProgressColors(
                                  playedColor: Colors.red,
                                  bufferedColor: Colors.grey,
                                  backgroundColor: Colors.black26,
                                ),
                              ),
                            ],
                          )
                        : null,
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
