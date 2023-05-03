// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../../playlist.dart';

class PlaylistInfo extends StatelessWidget {
  Playlist playlist;
  PlaylistInfo({required this.playlist});

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
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(playlist.playlistType),
                  Text(playlist.name),
                  Text(playlist.description),
                  Row(
                    children: [
                      // TODO: add dots between info
                      Text(playlist.owner),
                      Text("${playlist.likes} likes"),
                      // TODO: these two in one string, separated by coma
                      Text("${playlist.songsCount} songs"),
                      Text("${playlist.minutes} min")
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
