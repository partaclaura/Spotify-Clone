// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../left_pannel.dart';
import 'top_playlists.dart';
import 'playlists/row_playlists.dart';
import '../playlist.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Row(children: [
                    LeftPannel(),
                    Expanded(
                        child: Container(
                            color: Color.fromRGBO(26, 26, 26, 1),
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TopPlaylists(),
                                  PlaylistRow(
                                      rowName: "Your top mixes",
                                      playlists: [
                                        Playlist(name: 'Rock Mix'),
                                        Playlist(name: 'Pop Mix'),
                                        Playlist(name: 'Jazz Mix'),
                                        Playlist(name: 'Chill Mix'),
                                        Playlist(name: '70\' Mix')
                                      ]),
                                  PlaylistRow(
                                      rowName: "Made for User",
                                      playlists: [
                                        Playlist(name: 'Daily Mix 1'),
                                        Playlist(name: 'Daily Mix 2'),
                                        Playlist(name: 'Daily Mix 3'),
                                        Playlist(name: 'Daily Mix 4'),
                                        Playlist(name: 'Daily Mix 5')
                                      ]),
                                ],
                              ),
                            )))
                  ]),
                ))));
  }
}
