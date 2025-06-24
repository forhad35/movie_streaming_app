import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayController extends GetxController {
  late VideoPlayerController videoController;
  RxInt selectedEpisode = 0.obs;

  List<Uri> videoUrls = [
    Uri.parse(
      "https://github.com/forhad35/movie_streaming_app/blob/main/assets/video.mp4",
    ),
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
