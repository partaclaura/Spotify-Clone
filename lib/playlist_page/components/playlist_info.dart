// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../../playlist.dart';

class PlaylistInfo extends StatelessWidget {
  Playlist playlist;
  PlaylistInfo({required this.playlist});

  TextStyle setStyle(double size) {
    return TextStyle(
        fontWeight: FontWeight.bold, fontSize: size, color: Colors.white);
  }

  Widget setPlaylistName() {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Text(
        playlist.name,
        style: setStyle(60),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: const EdgeInsets.only(left: 25, right: 25, top: 60, bottom: 25),
      child: Row(
        children: [
          Container(
            height: 225,
            width: 225,
            color: Colors.black,
          ),
          Container(
              height: 250,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(playlist.playlistType, style: setStyle(17)),
                  setPlaylistName(),
                  Text(
                    playlist.description,
                    style: setStyle(15),
                  ),
                  Row(
                    children: [
                      Text(
                        "${playlist.owner} • ${playlist.likes} likes • ${playlist.songsCount} songs, ",
                        style: setStyle(15),
                      ),
                      Text(
                        "${playlist.minutes} min",
                        style: setStyle(15),
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
