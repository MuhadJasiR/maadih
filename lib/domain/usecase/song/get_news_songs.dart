import 'package:dartz/dartz.dart';
import 'package:madh/core/usecase/usecase.dart';
import 'package:madh/data/repository/auth/song/song_repository.dart';
import 'package:madh/service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await s1<SongRepositoryImp>().getNewSongs();
  }
}
