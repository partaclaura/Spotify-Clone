import 'package:flutter/material.dart';
import '../../playlist.dart';
import 'card_playlist.dart';

class PlaylistRow extends StatelessWidget {
  String rowName;
  List<Playlist> playlists;
  PlaylistRow({required this.rowName, required this.playlists});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rowName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardPlaylist(playlist: playlists[0]),
                  CardPlaylist(playlist: playlists[1]),
                  CardPlaylist(playlist: playlists[2]),
                  CardPlaylist(playlist: playlists[3]),
                  CardPlaylist(playlist: playlists[4]),
                ],
              )
            ],
          ),
        ));
  }
}
