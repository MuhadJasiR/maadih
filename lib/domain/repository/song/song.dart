import 'package:dartz/dartz.dart';

abstract class SongRepository {
  Future<Either> getNewSongs();
  Future<Either> getNewSongsCoverImage();
  Future<Either> getPlayList();
}
