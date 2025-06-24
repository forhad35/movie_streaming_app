import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../video_player/full_screen_player.dart';
import '../../video_player/video_controller.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideoPlayController());

    return Scaffold(
      appBar: AppBar(title: const Text("Episodes")),
      body: GetBuilder<VideoPlayController>(
        builder: (_) {
          return Column(
            children: [
              GestureDetector(
                onTap: () => Get.to(() => const FullScreenPlayer()),
                child: AspectRatio(
                  aspectRatio: controller.videoController.value.aspectRatio,
                  child: Stack(
                    children: [
                      VideoPlayer(controller.videoController),
                      Center(
                        child: IconButton(
                          icon: Icon(
                            controller.videoController.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 40,
                          ),
                          onPressed: () {
                            controller.videoController.value.isPlaying
                                ? controller.videoController.pause()
                                : controller.videoController.play();
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: VideoProgressIndicator(
                          controller.videoController,
                          allowScrubbing: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.videoUrls.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.play_circle_outline),
                      title: Text('Episode ${index + 1}'),
                      subtitle: Text('2h 3${index}min'),
                      trailing:
                      controller.selectedEpisode.value == index
                          ? const Text(
                        "Playing",
                        style: TextStyle(color: Colors.purple),
                      )
                          : null,
                      onTap: () => controller.changeEpisode(index),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}