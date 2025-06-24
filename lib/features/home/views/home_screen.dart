import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/common_widgets/card_with_title_outsite.dart';
import 'package:movie_streaming_app/common_widgets/screen_size.dart';
import 'package:movie_streaming_app/core/models/data/movie_data.dart';
import 'package:movie_streaming_app/features/home/controllers/home_controller.dart';
import 'package:movie_streaming_app/features/home/widgets/movie_header.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  int buttom_navigation_bar_index = 0;
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print(controller.homeTitle?.iterator.current.title);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: ListView(
          children: [
            SizedBox(
              height: 300,
              width: SizeConfig.safeWidth,
              child: MovieHeader(),
            ),
            Text("Streamly Original", style: Theme
                .of(context)
                .textTheme
                .displayLarge,),
            SizedBox(
              width: SizeConfig.safeWidth,
              height: 268,
              child: ListView.separated(
                separatorBuilder: (_, _) => const SizedBox(height: 10,)
                , itemCount: movieTitle.length,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(() {
                    if (controller.isLoading.value){
                      return Center( child: CircularProgressIndicator(),);
                    }
                    return TitleOutsideCard(
                        imageUrl: movieTitle[index]["poster"],
                        title: movieTitle[index]["title"],
                        cardHeight: 200,
                        cardWidth: 200);
                  });
                },

              ),
            )
          ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wifi), label: 'Live Stream'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: 'Library'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: buttom_navigation_bar_index,
        onTap: (index) {
          buttom_navigation_bar_index = index;
        },
      ),
    );
  }
}
