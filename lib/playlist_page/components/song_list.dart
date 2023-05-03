// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../../song.dart';

class SongList extends StatelessWidget {
  List<Song> songList;
  SongList({required this.songList});

  Widget createHeader() {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        createColumn("#", 25),
        createColumn("Title", 350),
        createColumn("Album", 200),
        createColumn("Date added", 200),
        Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Icon(
              Icons.schedule,
              color: Colors.grey,
            ))
      ]),
    );
  }

  Widget createSongEntry(int index, Song song) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          createColumn(index.toString(), 25),
          createColumn(song.title, 350),
          createColumn(song.album, 200),
          createColumn(song.addDate, 200),
          createColumn(song.length.toString(), 200)
        ],
      ),
    );
  }

  Widget createColumn(String text, double columnWidth) {
    return Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        width: columnWidth,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey),
        ));
  }

  Widget createSongList() {
    return Column(
      children: [
        createHeader(),
        Divider(
          color: Colors.grey,
          height: 0.1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: createSongList(),
    );
  }
}
