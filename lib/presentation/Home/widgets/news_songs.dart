import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madh/common/helper/is_dark_mode.dart';
import 'package:madh/core/colors/const_colors.dart';

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
        height: 260,
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
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kHeight(20),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      state.songsCoverImage[index]))),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 30,
                                width: 30,
                                transform: Matrix4.translationValues(10, 10, 0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context.isDarkMode
                                        ? kDarkGreyColor
                                        : kWhiteColor),
                                child: Icon(
                                  size: 18,
                                  Icons.play_arrow_rounded,
                                  color: context.isDarkMode
                                      ? kWhiteColor
                                      : kBlackColor,
                                ),
                              )),
                        ),
                      ),
                      kHeight(5),
                      const Text(
                        "Azhar kallur",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      kHeight(5),
                      const Text(
                        "thu shahe huban",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
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
