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
    double size = isWeb() ? 60 : 30;
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Text(
        playlist.name,
        style: setStyle(size),
      ),
    );
  }

  Widget createPlaylistImage() {
    return Container(
      height: isWeb() ? 225 : 200,
      width: isWeb() ? 225 : 200,
      color: Colors.black,
    );
  }

  Widget createDescription() {
    double size = isWeb() ? 15 : 12;
    return Text(
      playlist.description,
      style: setStyle(size),
    );
  }

  Widget createDetails() {
    if (isWeb()) {
      String details = "${playlist.owner} • "
          "${playlist.likes} likes • "
          "${playlist.songsCount} songs, "
          "${playlist.minutes} min";
      return Text(
        details,
        style: setStyle(15),
      );
    }

    var userDetails = Row(
      children: [
        const Icon(Icons.account_circle, color: Colors.white, size: 23),
        Container(
          width: 5,
        ),
        Text(
          playlist.owner,
          style: setStyle(15),
        )
      ],
    );

    String details = playlist.likes != 0 ? "${playlist.likes} likes • " : "";
    details += "${playlist.minutes}min";
    var playlistDetails = Row(
      children: [
        const Icon(Icons.language, color: Colors.white, size: 20),
        Container(
          width: 5,
        ),
        Text(
          details,
          style: setStyle(15),
        )
      ],
    );

    return Column(
      children: [
        userDetails,
        Container(
          height: 5,
        ),
        playlistDetails
      ],
    );
  }

  Widget createPlaylistInfo(BuildContext context) {
    return Container(
        height: isWeb() ? 250 : 200,
        width: isWeb() ? null : MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (isWeb()) Text('Playlist', style: setStyle(17)),
            setPlaylistName(),
            createDescription(),
            createDetails()
          ],
        ));
  }

  List<Widget> createPlaylistInfoBody(BuildContext context) {
    return [createPlaylistImage(), createPlaylistInfo(context)];
  }

  @override
  Widget build(BuildContext context) {
    Widget componentType = isWeb()
        ? Row(children: createPlaylistInfoBody(context))
        : Column(children: createPlaylistInfoBody(context));

    var containerPadding = isWeb()
        ? const EdgeInsets.only(left: 25, right: 25, top: 60, bottom: 25)
        : const EdgeInsets.only(left: 5, right: 15, top: 100, bottom: 5);

    return Container(
      color: isWeb()
          ? const Color.fromRGBO(48, 48, 48, 1)
          : const Color.fromRGBO(26, 26, 26, 1),
      padding: containerPadding,
      child: componentType,
    );
  }
}
