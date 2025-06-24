import 'package:flutter/material.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Notification bar er pichone image dekhate
      backgroundColor: Colors.black,
      body:Stack(
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
