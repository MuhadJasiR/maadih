import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:madh/core/size/const_size.dart';
import 'package:madh/presentation/Home/bloc/news_songs_cubit.dart';
import 'package:madh/presentation/Home/bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongsCoverImage(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
            builder: (context, state) {
          if (state is NewsSongsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is NewsSongsCoverImageLoaded) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => kWidth(14),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 150,
                  width: 120,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      state.songsCoverImage[index]))),
                        ),
                      ),
                      Text("Sample")
                    ],
                  ),
                );
              },
              itemCount: state.songsCoverImage.length,
            );
          }

          return Container();
        }),
      ),
    );
  }
}
