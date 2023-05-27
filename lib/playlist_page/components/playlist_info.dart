// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../../playlist.dart';
import '../../platform.dart';

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

  Widget createPlaylistImage() {
    return Container(
      height: 225,
      width: 225,
      color: Colors.black,
    );
  }

  Widget createDescription() {
    return Text(
      playlist.description,
      style: setStyle(15),
    );
  }

  Widget createDetails() {
    String details = "${playlist.owner} • "
        "${playlist.likes} likes • "
        "${playlist.songsCount} songs, "
        "${playlist.minutes} min";
    return Text(
      details,
      style: setStyle(15),
    );
  }

  Widget createPlaylistInfo() {
    return Container(
        height: 250,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Playlist', style: setStyle(17)),
            setPlaylistName(),
            createDescription(),
            createDetails()
          ],
        ));
  }

  List<Widget> createPlaylistInfoBody() {
    return [createPlaylistImage(), createPlaylistInfo()];
  }

  @override
  Widget build(BuildContext context) {
    Widget componentType = isWeb()
        ? Row(children: createPlaylistInfoBody())
        : Column(children: createPlaylistInfoBody());
    return Container(
      color: const Color.fromRGBO(48, 48, 48, 1),
      padding: const EdgeInsets.only(left: 25, right: 25, top: 60, bottom: 25),
      child: componentType,
    );
  }
}
