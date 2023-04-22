import 'package:flutter/material.dart';
import '../../playlist.dart';

class CardPlaylist extends StatelessWidget {
  Playlist playlist;
  CardPlaylist({required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: MediaQuery.of(context).size.width / 8.5,
          width: MediaQuery.of(context).size.width / 8.5,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: Text(
            playlist.name,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: Text(
            playlist.description,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.white24),
          ),
        ),
      ]),
    );
  }
}
