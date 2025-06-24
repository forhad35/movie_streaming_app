import 'package:get/get.dart';
import 'package:movie_streaming_app/core/models/data-model/movile_poster_model.dart';
import 'package:movie_streaming_app/core/models/data/movie_data.dart';

class HomeController extends GetxController {
  Iterable<MoviePosterModel>? homeTitle;
  Rx<bool> isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    try {
      isLoading.value = true;
      homeTitle = movieTitle.map((e) => e).cast();
    }finally{
      isLoading.value = false;
    }
    //
  }
}
