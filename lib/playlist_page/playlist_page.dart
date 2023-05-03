import 'package:flutter/material.dart';
import '../playlist.dart';
import '../left_pannel.dart';
import 'playlist_view.dart';

class PlaylistPage extends StatelessWidget {
  Playlist playlist;
  PlaylistPage({required this.playlist});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                height: double.infinity,
                child: SingleChildScrollView(
                    child: Row(children: [
                  LeftPannel(),
                  PlaylistView(
                    playlist: Playlist(name: "Playlist Name"),
                  )
                ])))));
  }
}
