// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../../song.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class SongList extends StatefulWidget {
  List songList;
  SongList({required this.songList});

  @override
  _State get createState => _State();
}

class _State extends State<SongList> {
  Future<List> getSongs() async {
    List playlistSongs = [];
    final String response = await rootBundle.loadString('assets/songs.json');
    final data = await json.decode(response);
    setState(() {
      List songs = data['songs'];
      for (var song in songs) {
        if (widget.songList.contains(song['songId'])) {
          playlistSongs.add(song);
        }
      }
    });
    return playlistSongs;
  }

  Widget createHeader() {
    return Container(
      child: Row(children: [
        createColumn("#", 25),
        createColumn("Title", 350),
        createColumn("Album", 200),
        createColumn("Date added", 200),
        Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: const Icon(
              Icons.schedule,
              color: Colors.grey,
            ))
      ]),
    );
  }

  Widget createSongEntry(int index, Song song) {
    return Container(
      child: Row(
        children: [
          createColumn(index.toString(), 25),
          createColumn(song.title, 350),
          createColumn(song.album, 200),
          createColumn("Date added", 200),
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
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.grey,
          ),
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
        FutureBuilder(
            future: getSongs(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) =>
                snapshot.hasData
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemCount: widget.songList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return createSongEntry(
                              index + 1, Song(snapshot.data![index]));
                        })
                    : Center(child: CircularProgressIndicator()))
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
