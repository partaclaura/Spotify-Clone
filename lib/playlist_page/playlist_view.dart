// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:spotify_clone/platform.dart';
import 'components/playlist_info.dart';
import 'components/song_list.dart';
import '../playlist.dart';
import '../song.dart';
import '../user.dart';

class PlaylistView extends StatelessWidget {
  Playlist playlist;
  User user;
  PlaylistView({required this.playlist, required this.user});

  List<Song> createSongList() {
    List<Song> songs = [];
    for (var songId in playlist.songs) {
      songs.add(Song(songId));
    }
    return songs;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            color: const Color.fromRGBO(26, 26, 26, 1),
            height: MediaQuery.of(context).size.height,
            width: isWeb() ? null : MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  PlaylistInfo(
                    playlist: playlist,
                  ),
                  SongList(
                    playlist: playlist,
                    user: user,
                  ),
                ]))));
  }
}
