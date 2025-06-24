import 'package:movie_streaming_app/core/models/data/movie_data.dart';

class MoviePosterModel {
  final int id;
  final String title;
  final String poster;

  MoviePosterModel({
    required this.id,
    required this.title,
    required this.poster,
  });

  // JSON থেকে মডেল তৈরি করার ফ্যাক্টরি কনস্ট্রাক্টর
  factory MoviePosterModel.fromJson(Map<String, dynamic> json) {
    return MoviePosterModel(
      id: json['id'] ?? 0, // ডিফল্ট ভ্যালু 0
      title: json['title'] ?? '', // ডিফল্ট খালি স্ট্রিং
      poster: json['poster'] ?? '', // ডিফল্ট খালি স্ট্রিং
    );
  }

  // মডেল থেকে JSON এ কনভার্ট করার মেথড
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'poster': poster,
    };
  }
}

