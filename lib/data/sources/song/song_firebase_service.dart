import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:madh/data/model/song/song.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:madh/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getPlayList();
  Future<Either> getNewSongsCoverImage();
}

class SongsFirebaseServiceImpl extends SongFirebaseService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection("Songs")
          .orderBy("releaseDate", descending: true)
          .limit(30)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      return left("an Error occurred while fetching songs");
    }
  }

  @override
  Future<Either> getNewSongsCoverImage() async {
    try {
      List<String> imageUrl = [];
      final ListResult result = await _firebaseStorage.ref("covers").listAll();
      for (var element in result.items) {
        final String urls = await element.getDownloadURL();
        imageUrl.add(urls);
      }
      log(imageUrl.toString(), name: "image urls");
      return right(imageUrl);
    } catch (e) {
      log(e.toString(), name: "Error while fetching image cover");

      return left("an error while fetching songs cover image");
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection("Songs")
          .orderBy("releaseDate", descending: true)
          .get();

      for (var elements in data.docs) {
        var songModel = SongModel.fromJson(elements.data());
        songs.add(songModel.toEntity());
      }
      log(songs.toString(), name: 'playlist');
      return Right(songs);
    } catch (e) {
      log(e.toString(), name: "playList");
      return left("an Error occurred, Please try again");
    }
  }
}
