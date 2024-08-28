import 'package:dartz/dartz.dart';
import 'package:madh/data/sources/song/song_firebase_service.dart';
import 'package:madh/domain/repository/song/song.dart';
import 'package:madh/service_locator.dart';

class SongRepositoryImp extends SongRepository {
  @override
  Future<Either> getNewSongs() async {
    return await s1<SongFirebaseService>().getNewSongs();
  }
}
