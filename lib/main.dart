import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:madh/firebase_options.dart';
import 'package:madh/presentation/Home/pages/home.dart';

import 'package:madh/presentation/chose_mode/bloc/theme_cubit.dart';

import 'package:madh/service_locator.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          print("Building MaterialApp with ThemeMode: $mode");
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: mode,
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
