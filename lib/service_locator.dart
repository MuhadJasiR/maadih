import 'package:get_it/get_it.dart';
import 'package:madh/data/repository/auth/auth_repository_impl.dart';
import 'package:madh/data/sources/auth/auth_firebase_service.dart';
import 'package:madh/domain/repository/auth/auth.dart';
import 'package:madh/domain/usecase/auth/signup.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  s1.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  s1.registerSingleton<SignUpUseCase>(SignUpUseCase());
}
