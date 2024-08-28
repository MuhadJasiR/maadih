import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:madh/core/constants/app_urls.dart';
import 'package:madh/core/size/const_size.dart';
import 'package:madh/presentation/Home/bloc/news_songs_cubit.dart';
import 'package:madh/presentation/Home/bloc/news_songs_state.dart';

class NewsSongs extends StatefulWidget {
  const NewsSongs({super.key});

  @override
  State<NewsSongs> createState() => _NewsSongsState();
}

class _NewsSongsState extends State<NewsSongs> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  late Future<List<String>> _imageUrls;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageUrls = _loadImages();
  }

  Future<List<String>> _loadImages() async {
    List<String> imageUrls = [];
    final ListResult result = await _storage.ref("covers").listAll();
    for (var ref in result.items) {
      final String url = await ref.getDownloadURL();
      imageUrls.add(url);
    }
    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
            builder: (context, state) {
          if (state is NewsSongsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is NewsSongsLoaded) {
            return FutureBuilder(
              future: _imageUrls,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No images found'));
                } else {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => kWidth(14),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 160,
                        width: 160,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${AppUrls.fireStorage}${state.songs[index].artist}.jpg?${AppUrls.altMedia}"))),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: state.songs.length,
                  );
                }
              },
            );
          }

          return Container();
        }),
      ),
    );
  }
}
