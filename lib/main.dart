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

import 'common_widget/card_with_title_outsite.dart';
// // import 'features/episode/view/episode_page.dart';

// void main() {
//   runApp(const MyApp());
// }


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MovieHeaderScreen(),
  ));
}

class MovieHeaderScreen extends StatelessWidget {
  const MovieHeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Notification bar er pichone image dekhate
      backgroundColor: Colors.black,
      body: ListView(

        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                // 🔹 Background Image
                Positioned.fill(
                  child: Image.network(
                    'https://m.media-amazon.com/images/M/MV5BODA5Y2M0NjctNWQzMy00ODRhLWE0MzUtYmE1YTAzZjYyYmQyXkEyXkFqcGc@._V1_.jpg', // Replace with your image
                    fit: BoxFit.cover,
                  ),
                ),

                // 🔹 Dark gradient overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.1),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),

                // 🔹 Content
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔍 Search + Mic + Notification
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                height: 42,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(Icons.search, color: Colors.white70),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: TextField(
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          hintText: 'Search',
                                          hintStyle: TextStyle(color: Colors.white54),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.mic, color: Colors.white70),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Stack(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.notifications_none,
                                      color: Colors.white),
                                  onPressed: () {},
                                ),
                                Positioned(
                                  right: 6,
                                  top: 6,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Text(
                                      '1',
                                      style: TextStyle(fontSize: 10, color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),

                        const Spacer(),

                        // 🔹 IMDb + Title
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'IMDb',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '6.8/10',
                              style: TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ],
                        ),

                        const SizedBox(height: 4),
                        const Text(
                          'Companion',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // 🔹 Buttons: Watch Now, Download, Share, Bookmark
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                              ),
                              onPressed: () {},
                              child: const Text('Watch Now'),
                            ),
                            const SizedBox(width: 8),
                            _iconButton(Icons.download),
                            const SizedBox(width: 8),
                            _iconButton(Icons.share),
                            const SizedBox(width: 8),
                            _iconButton(Icons.bookmark_border),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height: 300,
              width: MediaQuery.sizeOf(context).width * 0.9,

              child: MultiCardDemo())
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
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

  List<Uri> videoUrls = [
    Uri.parse("https://github.com/forhad35/movie_streaming_app/blob/main/assets/video.mp4")
    // 'https://github.com/forhad35/movie_streaming_app/blob/main/assets/video.mp4',
    // 'httUps://github.com/forhad35/movie_streaming_app/blob/main/assets/video.mp4',
  ];

  @override
  void onInit() {
    super.onInit();
    videoController = VideoPlayerController.networkUrl(videoUrls[0])
      ..initialize().then((_) => update());
  }

  void changeEpisode(int index) {
    selectedEpisode.value = index;
    videoController.pause();
    videoController.dispose();
    videoController = VideoPlayerController.networkUrl(videoUrls[index])
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
