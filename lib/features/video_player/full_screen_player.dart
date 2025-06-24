import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/video_player/video_controller.dart';
import 'package:video_player/video_player.dart';
class FullScreenPlayer extends StatelessWidget {
  const FullScreenPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VideoPlayController>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: controller.videoController.value.aspectRatio,
                child: VideoPlayer(controller.videoController),
              ),
            ),
            Positioned(
              top: 20,
              left: 16,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Get.back(),
              ),
            ),
            Center(
              child: IconButton(
                icon: Icon(
                  controller.videoController.value.isPlaying
                      ? Icons.pause_circle
                      : Icons.play_circle,
                  size: 64,
                  color: Colors.white,
                ),
                onPressed: () {
                  controller.videoController.value.isPlaying
                      ? controller.videoController.pause()
                      : controller.videoController.play();
                },
              ),
            ),
            Positioned(
              right: 0,
              top: 100,
              bottom: 100,
              child: RotatedBox(
                quarterTurns: 1,
                child: Slider(
                  value:
                  controller.videoController.value.position.inSeconds
                      .toDouble(),
                  min: 0,
                  max:
                  controller.videoController.value.duration.inSeconds
                      .toDouble(),
                  onChanged: (value) {
                    controller.videoController.seekTo(
                      Duration(seconds: value.toInt()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
