import 'package:flutter/material.dart';
import 'package:movie_streaming_app/features/movie_details.dart';
class TitleOutsideCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double cardHeight,cardWidth;

  const TitleOutsideCard({super.key, required this.imageUrl, required this.title,required this.cardHeight,required this.cardWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[900],
      ),
      child: InkWell(
        
        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailPage())),
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
  final double cardHeight,cardWidth;
  const TitleInsideCard({super.key, required this.imageUrl, required this.title, required this.cardHeight, required this.cardWidth});

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
  final double cardHeight,cardWidth;
  const ImageOnlyCard({super.key, required this.imageUrl, required this.cardHeight, required this.cardWidth});

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
