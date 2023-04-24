import 'package:flutter/material.dart';
import '../../playlist.dart';
import 'card_playlist.dart';

class PlaylistRow extends StatelessWidget {
  String rowName;
  List<Playlist> playlists;
  PlaylistRow({required this.rowName, required this.playlists});

  List<Widget> createPlaylistCards(BuildContext context) {
    int cardsPerRow = 5;
    List<Widget> cards = [];
    if (MediaQuery.of(context).size.width > 1102 &&
        MediaQuery.of(context).size.width <= 1384) {
      cardsPerRow = 4;
    } else if (MediaQuery.of(context).size.width > 900 &&
        MediaQuery.of(context).size.width <= 1102) {
      cardsPerRow = 3;
    } else if (MediaQuery.of(context).size.width <= 900) {
      cardsPerRow = 2;
    }

    for (int i = 0; i < cardsPerRow; i++) {
      cards.add(CardPlaylist(playlist: playlists[i]));
      cards.add(Container(
        width: 20,
      ));
    }

    return cards;
  }

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
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: createPlaylistCards(context),
              )
            ],
          ),
        ));
  }
}
