import 'package:flutter/material.dart';
import 'playlist_button.dart';

class Playlists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Column(
          children: [
            PlaylistButton(playlistName: 'CustomPlaylist'),
            PlaylistButton(playlistName: 'CustomPlaylist')
          ],
        ));
  }
}
