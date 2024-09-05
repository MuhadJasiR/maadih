import 'package:get_it/get_it.dart';
import 'package:madh/data/repository/auth/auth_repository_impl.dart';
import 'package:madh/data/repository/song/song_repository.dart';
import 'package:madh/data/sources/auth/auth_firebase_service.dart';
import 'package:madh/data/sources/song/song_firebase_service.dart';
import 'package:madh/domain/repository/auth/auth.dart';
import 'package:madh/domain/repository/song/song.dart';
import 'package:madh/domain/usecase/auth/sign_in.dart';
import 'package:madh/domain/usecase/auth/signup.dart';
import 'package:madh/domain/usecase/song/get_news_songs.dart';
import 'package:madh/domain/usecase/song/get_songs_cover_image.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  s1.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  s1.registerSingleton<SongFirebaseService>(SongsFirebaseServiceImpl());
  s1.registerSingleton<SongRepository>(SongRepositoryImp());
  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  s1.registerSingleton<SignUpUseCase>(SignUpUseCase());
  s1.registerSingleton<SignInUseCase>(SignInUseCase());
  s1.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  s1.registerSingleton<GetSongsCoverImageUseCase>(GetSongsCoverImageUseCase());
}
