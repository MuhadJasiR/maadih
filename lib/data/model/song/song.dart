import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:madh/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  String? imageUrl;

  SongModel({
    required this.imageUrl,
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
  });

  SongModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    artist = json["artist"];
    duration = json["duration"];
    releaseDate = json["releaseDate"];
    imageUrl = json["imageUrl"];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() => SongEntity(
        title: title!,
        artist: artist!,
        duration: duration!,
        releaseDate: releaseDate!,
        imageUrl: imageUrl!,
      );
}
