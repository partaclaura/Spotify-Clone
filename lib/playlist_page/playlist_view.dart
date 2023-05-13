// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'components/playlist_info.dart';
import 'components/song_list.dart';
import '../playlist.dart';
import '../song.dart';

class PlaylistView extends StatelessWidget {
  Playlist playlist;
  PlaylistView({required this.playlist});

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
            color: Color.fromRGBO(26, 26, 26, 1),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  PlaylistInfo(
                    playlist: playlist,
                  ),
                  SongList(songList: playlist.songs),
                ]))));
  }
}
