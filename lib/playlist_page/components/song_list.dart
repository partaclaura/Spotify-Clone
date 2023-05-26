// ignore_for_file: use_key_in_widget_constructors, must_be_immutable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:spotify_clone/playlist.dart';
import '../../song.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../playlist_page.dart';
import '../../user.dart';

class SongList extends StatefulWidget {
  Playlist playlist;
  User user;
  SongList({required this.playlist, required this.user});

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
        if (widget.playlist.songs.contains(song['songId'])) {
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
        createColumn("Date added", 240),
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
          createColumn(song.length.toString(), 200, true, song.songId),
        ],
      ),
    );
  }

  Future updateLikedSongs(int userId, int songId) async {
    //print("CURRENT PATH: ${Directory.current.path}/lib/");
    var fullFilePath =
        'C:/Users/Laura/Desktop/Spotify Clone/spotify_clone/assets/users.json';
    File jsonFile = File(fullFilePath);
    final String response = await rootBundle.loadString('assets/users.json');
    dynamic data = await json.decode(response);
    setState(() {
      List users = data['users'];
      for (var crtUser in users) {
        if (crtUser['id'] == userId) {
          List likedSongs = crtUser['likedSongs'];
          likedSongs.add(songId);
          widget.user.likedSongs = likedSongs;
          crtUser['likedSongs'] = likedSongs;
        }
        data['users'] = users;
        //jsonFile.writeAsStringSync(json.encode(data));
      }
    });
  }

  bool isLiked(int id) {
    if (widget.user.likedSongs.contains(id)) {
      return true;
    }
    return false;
  }

  Widget getIcon(int id) {
    if (isLiked(id)) {
      return Icon(Icons.favorite);
    }
    return const Icon(Icons.favorite_border);
  }

  Widget createColumn(String text, double columnWidth,
      [bool fav = false, int id = 0]) {
    if (fav == true) {
      return Container(
          padding: const EdgeInsets.only(left: 5, right: 5),
          width: columnWidth,
          child: Row(children: [
            IconButton(
              icon: getIcon(id),
              tooltip: 'Add to favourites',
              onPressed: () {
                if (isLiked(id)) {
                  widget.user.likedSongs.remove(id);
                } else {
                  widget.user.likedSongs.add(id);
                }
              },
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey,
              ),
            )
          ]));
    }
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
                        itemCount: widget.playlist.songs.length,
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
