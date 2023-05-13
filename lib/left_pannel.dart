// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'navbar/nav_bar.dart';
import 'playlists/playlist_button.dart';
import 'user.dart';
import 'playlist.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class LeftPannel extends StatefulWidget {
  User user;
  LeftPannel({required this.user});

  @override
  _State createState() => _State();
}

class _State extends State<LeftPannel> {
  Future<List> getUserPlaylists() async {
    List userPlaylists = [];
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
    return userPlaylists;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            NavBar(
              user: widget.user,
            ),
            Divider(
              color: Colors.grey,
              height: 0.1,
            ),
            Expanded(
                child: FutureBuilder(
                    future: getUserPlaylists(),
                    builder: (BuildContext context,
                            AsyncSnapshot<List> snapshot) =>
                        snapshot.hasData
                            ? ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return PlaylistButton(
                                    playlist: Playlist(snapshot.data![index]),
                                    user: widget.user,
                                  );
                                })
                            : Center(child: CircularProgressIndicator()))),
          ],
        ));
  }
}
