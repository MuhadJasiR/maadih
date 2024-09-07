import 'package:madh/domain/entities/song/song.dart';

abstract class PlayListSate {}

class PlayListLoading extends PlayListSate {}

class PlayListLoaded extends PlayListSate {
  final List<SongEntity> songs;
  PlayListLoaded({required this.songs});
}

class PlayListLoadFailure extends PlayListSate {}
