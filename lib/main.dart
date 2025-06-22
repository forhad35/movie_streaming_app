// pubspec.yaml dependencies:
// dependencies:
//   flutter:
//     sdk: flutter
//   video_player: ^2.7.1
//   get: ^4.6.6

// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
// // import 'features/episode/view/episode_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Video Player UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const EpisodePage(),
    );
  }
}

// lib/features/episode/controller/video_controller.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';

class VideoPlayController extends GetxController {
  late VideoPlayerController videoController;
  RxInt selectedEpisode = 0.obs;

  List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    'https://samplelib.com/lib/preview/mp4/sample-10s.mp4',
  ];

  @override
  void onInit() {
    super.onInit();
    videoController = VideoPlayerController.network(videoUrls[0])
      ..initialize().then((_) => update());
  }

  void changeEpisode(int index) {
    selectedEpisode.value = index;
    videoController.pause();
    videoController.dispose();
    videoController = VideoPlayerController.network(videoUrls[index])
      ..initialize().then((_) {
        update();
        videoController.play();
      });
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}

// lib/features/episode/view/episode_page.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
// import '../controller/video_controller.dart';
// import 'full_screen_player.dart';

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
                      trailing: controller.selectedEpisode.value == index
                          ? const Text("Playing", style: TextStyle(color: Colors.purple))
                          : null,
                      onTap: () => controller.changeEpisode(index),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

// lib/features/episode/view/full_screen_player.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
// import '../controller/video_controller.dart';

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
                  value: controller.videoController.value.position.inSeconds.toDouble(),
                  min: 0,
                  max: controller.videoController.value.duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    controller.videoController.seekTo(Duration(seconds: value.toInt()));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
