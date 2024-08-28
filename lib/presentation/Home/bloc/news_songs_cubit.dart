import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madh/domain/usecase/song/get_news_songs.dart';
import 'package:madh/presentation/Home/bloc/news_songs_state.dart';
import 'package:madh/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await s1<GetNewsSongsUseCase>().call();
    returnedSongs.fold(
      (l) {
        emit(NewsSongsLoadFailure());
      },
      (r) {
        emit(NewsSongsLoaded(songs: r));
      },
    );
  }
}
