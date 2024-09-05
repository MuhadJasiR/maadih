import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madh/domain/usecase/song/get_news_songs.dart';
import 'package:madh/domain/usecase/song/get_songs_cover_image.dart';
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
        log(r.toString(), name: "news songs");
        emit(NewsSongsLoaded(songs: r));
      },
    );
  }

  Future<void> getNewsSongsCoverImage() async {
    var returnedImage = await s1<GetSongsCoverImageUseCase>().call();
    returnedImage.fold(
      (l) {
        emit(NewsSongsLoadFailure());
      },
      (r) {
        log(r.toString(), name: "news cover songs");

        emit(NewsSongsCoverImageLoaded(songsCoverImage: r));
      },
    );
  }
}
