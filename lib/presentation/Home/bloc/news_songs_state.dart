import 'package:madh/domain/entities/song/song.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  final List<SongEntity> songs;
  NewsSongsLoaded({required this.songs});
}

class NewsSongsCoverImageLoaded extends NewsSongsState {
  final List<String> songsCoverImage;
  NewsSongsCoverImageLoaded({required this.songsCoverImage});
}

class NewsSongsLoadFailure extends NewsSongsState {}
