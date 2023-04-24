import 'package:flutter/material.dart';
import '../../playlist.dart';

class CardPlaylist extends StatelessWidget {
  Playlist playlist;
  CardPlaylist({required this.playlist});

  double getCardSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double size = width / 8.1;

    // find some formula for this
    if (width > 1384 && width < 1531) {
      size = width / 8.7;
    } else if (width > 1265 && width < 1384) {
      size = width / 7;
    } else if (width > 1165 && width < 1265) {
      size = width / 7.5;
    } else if (width > 1102 && width < 1165) {
      size = width / 7.9;
    } else if (width > 997 && width < 1102) {
      size = width / 6;
    } else if (width > 900 && width < 997) {
      size = width / 6.7;
    } else if (width > 813 && width < 900) {
      size = width / 4.5;
    } else if (width < 813) {
      size = width / 5.5;
    }

    return size;
  }

  @override
  Widget build(BuildContext context) {
    double size = getCardSize(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: size,
          width: size,
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
