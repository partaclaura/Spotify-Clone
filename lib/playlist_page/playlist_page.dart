import 'package:flutter/material.dart';
import '../playlist.dart';
import '../left_pannel.dart';
import '../user.dart';
import 'playlist_view.dart';
import '../platform.dart';
import '../navbar/android_navbar.dart';

class PlaylistPage extends StatelessWidget {
  Playlist playlist;
  User user;
  PlaylistPage({required this.playlist, required this.user});

  Widget createPlaylistPage() {
    var components = isWeb()
        ? [
            LeftPannel(
              user: user,
            ),
            PlaylistView(
              playlist: playlist,
              user: user,
            )
          ]
        : [
            PlaylistView(
              playlist: playlist,
              user: user,
            )
          ];

    return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(child: Row(children: components)));
  }

  @override
  Widget build(BuildContext context) {
    return isWeb()
        ? MaterialApp(home: Scaffold(body: createPlaylistPage()))
        : MaterialApp(
            home: Scaffold(
            body: createPlaylistPage(),
            bottomNavigationBar: AndroidNavBar(user: user),
          ));
  }
}
