import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madh/core/colors/const_colors.dart';
import 'package:madh/core/size/const_size.dart';
import 'package:madh/domain/entities/song/song.dart';
import 'package:madh/presentation/Home/bloc/play_list_cubit.dart';
import 'package:madh/presentation/Home/bloc/play_list_state.dart';
import 'package:madh/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:madh/presentation/song_player/bloc/song_player_state.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songs;
  const SongPlayerPage({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Now Playing"),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocProvider(
            create: (context) => SongPlayerCubit()
              ..loadSong(
                  "https://firebasestorage.googleapis.com/v0/b/maadih-c95a8.appspot.com/o/songs%2FWo%20Shehr%20e%20Mohabbat%20%20Beautiful%20Naat%20Sharif%20%20Azharudheen%20Rabbani%20Kallur.mp3?alt=media&token=6cff46f5-86e2-4a91-a5ab-e98f778af017"),
            child: Column(
              children: [
                SongCoverImage(songs: songs),
                kHeight(10),
                SongTItle(songs: songs),
                kHeight(10),
                songPlayer()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget songPlayer() {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
        builder: (context, state) {
      if (state is SongPlayerLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is SongPlayerLoaded) {
        return Column(
          children: [
            Slider(
              value: context
                  .read<SongPlayerCubit>()
                  .songPosition
                  .inSeconds
                  .toDouble(),
              max: context
                  .read<SongPlayerCubit>()
                  .songDuration
                  .inSeconds
                  .toDouble(),
              min: 0.0,
              onChanged: (value) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formateDuration(
                    context.read<SongPlayerCubit>().songPosition)),
                Text(formateDuration(
                    context.read<SongPlayerCubit>().songDuration))
              ],
            ),
            GestureDetector(
              onTap: () {
                context.read<SongPlayerCubit>().playOrPause();
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: kPrimaryColor),
                child: Icon(context.read<SongPlayerCubit>().audioPlayer.playing
                    ? Icons.pause
                    : Icons.play_arrow_rounded),
              ),
            )
          ],
        );
      }

      if (state is SongPlayerFailure) {
        return const Text("something went wrong on failure");
      }

      return const Text("something went wrong");
    });
  }

  String formateDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}

class SongTItle extends StatelessWidget {
  const SongTItle({
    super.key,
    required this.songs,
  });

  final SongEntity songs;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songs.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              songs.artist,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_rounded))
      ],
    );
  }
}

class SongCoverImage extends StatelessWidget {
  const SongCoverImage({
    super.key,
    required this.songs,
  });

  final SongEntity songs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(songs.imageUrl), fit: BoxFit.cover)),
    );
  }
}
