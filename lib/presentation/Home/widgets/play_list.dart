import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madh/common/helper/is_dark_mode.dart';
import 'package:madh/core/colors/const_colors.dart';

import 'package:madh/domain/entities/song/song.dart';
import 'package:madh/presentation/Home/bloc/play_list_cubit.dart';
import 'package:madh/presentation/Home/bloc/play_list_state.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayListCubit()..getPlayList(),
      child: BlocBuilder<PlayListCubit, PlayListSate>(
        builder: (context, state) {
          if (state is PlayListLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PlayListLoaded) {
            return Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "PlayList",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text("See More"),
                  ],
                ),
                _songs(state.songs)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    transform: Matrix4.translationValues(0, 0, 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.isDarkMode ? kDarkGreyColor : kWhiteColor,
                    ),
                    child: Icon(
                      size: 18,
                      Icons.play_arrow_rounded,
                      color: context.isDarkMode ? kWhiteColor : kBlackColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songs[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        songs[index].artist,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    songs[index].duration.toString().replaceAll(".", ":"),
                    style: const TextStyle(fontSize: 14),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: songs.length,
    );
  }
}
