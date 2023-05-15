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

  Widget androidPlaylistPage() {
    return Container(
        height: double.infinity,
        child: SingleChildScrollView(
            child: Row(children: [
          PlaylistView(
            playlist: playlist,
          )
        ])));
  }

  Widget webPlaylistPage() {
    return Container(
        height: double.infinity,
        child: SingleChildScrollView(
            child: Row(children: [
          LeftPannel(
            user: user,
          ),
          PlaylistView(
            playlist: playlist,
          )
        ])));
  }

  Widget createPlaylistPage() {
    Widget pageType = (isWeb()) ? webPlaylistPage() : androidPlaylistPage();
    return isWeb()
        ? MaterialApp(home: Scaffold(body: pageType))
        : MaterialApp(
            home: Scaffold(
            body: pageType,
            bottomNavigationBar: AndroidNavBar(user: user),
          ));
  }

  @override
  Widget build(BuildContext context) {
    return createPlaylistPage();
  }
}
