import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pichair/app/routes/app_routes.dart';
import 'package:pichair/presentation/entertainment_page/pages/music_page/controller/music_page_controller.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicPageController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text('Browse music')),
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : !controller.isUsbFound
            ? const Center(child: Text('No USB drive detected'))
            : controller.musics.isEmpty
            ? const Center(child: Text('No music found on USB'))
            : GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: controller.musics.length,
                itemBuilder: (context, index) {
                  final file = controller.musics[index];
                  final fileName = file.path.split('/').last;
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.entertainmentMusicPlayer,
                        arguments: file.path,
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                              ),
                              child: const Icon(
                                Icons.music_note,
                                size: 48,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              fileName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
