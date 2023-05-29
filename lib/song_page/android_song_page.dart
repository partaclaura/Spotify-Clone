// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../playlist.dart';
import '../user.dart';
import '../navbar/android_navbar.dart';
import '../song.dart';
import 'components/song_progress_indicator.dart';

class AndroidSongPage extends StatelessWidget {
  Playlist playlist;
  User user;
  Song song;
  AndroidSongPage(
      {required this.playlist, required this.user, required this.song});

  Widget createHeader(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_arrow_down,
                  color: Colors.white, size: 35),
            ),
            const Spacer(),
            Column(
              children: [
                const Text(
                  "PLAYING FROM YOUR LIBRARY",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                Container(
                  height: 2,
                ),
                Text(
                  playlist.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                )
              ],
            ),
            const Spacer(),
            const Icon(Icons.more_vert, color: Colors.white)
          ],
        ));
  }

  bool isLiked(int id) {
    if (user.likedSongs.contains(id)) {
      return true;
    }
    return false;
  }

  Widget getIcon(int id) {
    IconData icon = isLiked(id) ? Icons.favorite : Icons.favorite_border;
    return Icon(icon, color: Colors.blue, size: 25);
  }

  Widget createLikeButton(int id) {
    return IconButton(
      icon: getIcon(id),
      tooltip: 'Add to favourites',
      onPressed: () {
        if (isLiked(id)) {
          user.likedSongs.remove(id);
        } else {
          user.likedSongs.add(id);
        }
      },
    );
  }

  Widget createSongInfo(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                Container(
                  height: 5,
                ),
                Text(
                  song.artist,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.grey),
                )
              ],
            )),
        const Spacer(),
        createLikeButton(song.songId),
      ],
    );
  }

  Widget createSongImage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
      ),
    );
  }

  Widget createSongPageBody(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            Container(
              height: 25,
            ),
            createHeader(context),
            createSongImage(context),
            createSongInfo(context),
            ProgressIndicatorExample(
              song: song,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        color: const Color.fromRGBO(26, 26, 26, 1),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: createSongPageBody(context),
      ),
      bottomNavigationBar: AndroidNavBar(user: user),
    ));
  }
}
