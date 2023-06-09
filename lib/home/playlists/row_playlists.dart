// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../playlist.dart';
import 'card_playlist.dart';
import '../../user.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../../platform.dart';

class PlaylistRow extends StatefulWidget {
  String rowName;
  User user;
  String rowType;
  PlaylistRow(
      {super.key,
      required this.rowName,
      required this.user,
      required this.rowType});

  @override
  _State get createState => _State();
}

class _State extends State<PlaylistRow> {
  double getPadding() {
    return isWeb() ? 30 : 10;
  }

  List<Widget> createPlaylistCards(
      BuildContext context, List playlists, String rowType) {
    List<Widget> cards = [];
    int cardsPerRow = 5;
    double dividerSize = 10;
    if (isWeb()) {
      dividerSize = 20;
      if (MediaQuery.of(context).size.width > 1102 &&
          MediaQuery.of(context).size.width <= 1384) {
        cardsPerRow = 4;
      } else if (MediaQuery.of(context).size.width > 900 &&
          MediaQuery.of(context).size.width <= 1102) {
        cardsPerRow = 3;
      } else if (MediaQuery.of(context).size.width <= 900) {
        cardsPerRow = 2;
      }
    }

    if (playlists.length < cardsPerRow) {
      cardsPerRow = playlists.length;
    }

    for (int i = 0; i < cardsPerRow; i++) {
      cards.add(
          CardPlaylist(playlist: Playlist(playlists[i]), user: widget.user));
      cards.add(Container(
        width: dividerSize,
      ));
    }

    return cards;
  }

  Future<List> getRowPlaylists(String rowType) async {
    List userPlaylists = [];
    List rowPlaylists = [];
    final String response =
        await rootBundle.loadString('assets/playlists.json');
    final data = await json.decode(response);
    setState(() {
      List users = data['users'];
      for (var u in users) {
        if (u['userId'] == widget.user.id) {
          userPlaylists = u['playlists'];
        }
      }
    });

    for (var playlist in userPlaylists) {
      if (playlist['type'] == rowType) rowPlaylists.add(playlist);
    }

    if (rowType == "uniquely_yours") {
      rowPlaylists.add({
        "id": 55555,
        "name": "Liked Songs",
        "description": "",
        "type": "uniquely_yours",
        "owner": "user",
        "likes": 1,
        "songs": widget.user.likedSongs
      });
    }

    return rowPlaylists;
  }

  Widget createRow(BuildContext context, List playlists, String rowType) {
    List<Widget> cardPlaylists =
        createPlaylistCards(context, playlists, rowType);
    return isWeb()
        ? Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: cardPlaylists,
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: cardPlaylists));
  }

  Widget createRowTitle() {
    return Text(
      widget.rowName,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
    );
  }

  Widget createPlaylistsRow() {
    return FutureBuilder(
      future: getRowPlaylists(widget.rowType),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) =>
          snapshot.hasData
              ? createRow(context, snapshot.data!, widget.rowType)
              : const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black38,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(getPadding()),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [createRowTitle(), createPlaylistsRow()],
          ),
        ));
  }
}
