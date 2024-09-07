import 'package:dartz/dartz.dart';
import 'package:madh/core/usecase/usecase.dart';
import 'package:madh/domain/repository/song/song.dart';
import 'package:madh/service_locator.dart';

class GetPlayListUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await s1<SongRepository>().getPlayList();
  }
}
