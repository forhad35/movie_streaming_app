import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Poster Header
              Stack(
                children: [
                  Image.network(
                    'https://i.imgur.com/WzJdRzN.jpg',
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 16,
                    left: 12,
                    child: CircleAvatar(
                      backgroundColor: Colors.black45,
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 12,
                    child: Row(
                      children: [
                        Icon(Icons.mic, color: Colors.white),
                        SizedBox(width: 10),
                        Icon(Icons.share, color: Colors.white),
                        SizedBox(width: 10),
                        Icon(Icons.bookmark_border, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hip Hop Road Redemption',
                      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.purpleAccent),
                        const SizedBox(width: 6),
                        const Text('8.2', style: TextStyle(color: Colors.white)),
                        const SizedBox(width: 12),
                        const Text('2025', style: TextStyle(color: Colors.white)),
                        const SizedBox(width: 8),
                        Chip(
                          label: const Text('Subtitles'),
                          backgroundColor: Colors.purple,
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _iconButton(Icons.play_arrow, 'Play'),
                        _iconButton(Icons.download, ''),
                        _iconButton(Icons.share, ''),
                        _iconButton(Icons.bookmark_border, ''),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Genre: Drama Music, Action',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Join Jamal, a gifted street dancer... View More',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const CircleAvatar(backgroundImage: NetworkImage('https://i.imgur.com/BoN9kdC.png')),
                        const SizedBox(width: 8),
                        const Text('Michael Carter\nDirector', style: TextStyle(color: Colors.white)),
                        const SizedBox(width: 16),
                        const CircleAvatar(backgroundImage: NetworkImage('https://i.imgur.com/BoN9kdC.png')),
                        const SizedBox(width: 8),
                        const Text('Emily Lopez\nCast', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text('Episodes', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: NetworkImage('https://i.imgur.com/BoN9kdC.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Center(
                      child: Icon(Icons.play_circle, color: Colors.white, size: 30),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wifi), label: 'Live Stream'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 2,
        onTap: (index) {},
      ),
    );
  }

  static Widget _iconButton(IconData icon, String text) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.purple,
          child: Icon(icon, color: Colors.white),
        ),
        if (text.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
          )
      ],
    );
  }
}