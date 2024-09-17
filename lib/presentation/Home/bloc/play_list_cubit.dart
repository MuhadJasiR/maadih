import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madh/domain/usecase/song/get_play_list.dart';
import 'package:madh/presentation/Home/bloc/play_list_state.dart';
import 'package:madh/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await s1<GetPlayListUseCase>().call();
    returnedSongs.fold(
      (l) {
        emit(PlayListLoadFailure());
      },
      (r) {
        emit(PlayListLoaded(songs: r));
      },
    );
  }
}
