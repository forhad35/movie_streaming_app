import 'package:flutter/material.dart';
import 'package:movie_streaming_app/features/movie_details.dart';



class MultiCardDemo extends StatelessWidget {
  const MultiCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cards = [
      {
        'type': 'outside',
        'image': 'https://i.imgur.com/MXy0G9p.jpg',
        'title': 'Lakers vs Grizzlies\n8:00 AM'
      },
      {
        'type': 'inside',
        'image': 'https://i.imgur.com/szV8oJx.jpg',
        'title': 'Highlights | Dec 28'
      },
      {
        'type': 'image_only',
        'image': 'https://i.imgur.com/jqTqB9l.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "TV Shows",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: cards.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final item = cards[index];
                    final type = item['type'];

                    if (type == 'outside') {
                      return TitleOutsideCard(
                        imageUrl: item['image'],
                        title: item['title'],
                      );
                    } else if (type == 'inside') {
                      return TitleInsideCard(
                        imageUrl: item['image'],
                        title: item['title'],
                      );
                    } else {
                      return ImageOnlyCard(imageUrl: item['image']);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TitleOutsideCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const TitleOutsideCard({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[900],
      ),
      child: ElevatedButton(
        
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailPage())),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                height: 100,
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleInsideCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const TitleInsideCard({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          // Title at bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 13),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ImageOnlyCard extends StatelessWidget {
  final String imageUrl;

  const ImageOnlyCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
        height: 120,
        width: 160,
        fit: BoxFit.cover,
      ),
    );
  }
}
