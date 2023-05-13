import 'package:flutter/material.dart';
import '../playlist.dart';
import '../left_pannel.dart';
import '../user.dart';
import 'playlist_view.dart';

class PlaylistPage extends StatelessWidget {
  Playlist playlist;
  User user;
  PlaylistPage({required this.playlist, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                height: double.infinity,
                child: SingleChildScrollView(
                    child: Row(children: [
                  LeftPannel(
                    user: user,
                  ),
                  PlaylistView(
                    playlist: playlist,
                  )
                ])))));
  }
}
