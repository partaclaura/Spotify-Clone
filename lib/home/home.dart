// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../left_pannel.dart';
import 'top_playlists.dart';
import 'playlists/row_playlists.dart';
import '../user.dart';
import '../platform.dart';
import '../navbar/android_navbar.dart';

class Home extends StatelessWidget {
  final User user;
  const Home({super.key, required this.user});

  Widget createHomeBody(BuildContext context) {
    return Expanded(
        child: Container(
            color: Color.fromRGBO(26, 26, 26, 1),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopPlaylists(user: user),
                  PlaylistRow(
                    rowName: "Your top mixes",
                    user: user,
                    rowType: "spotify_mix",
                  ),
                  PlaylistRow(
                    rowName: "Made for User",
                    user: user,
                    rowType: "for_user",
                  ),
                  PlaylistRow(
                    rowName: "Uniquely yours",
                    user: user,
                    rowType: "uniquely_yours",
                  ),
                  PlaylistRow(
                      rowName: "Your playlists", user: user, rowType: "custom")
                ],
              ),
            )));
  }

  Widget createWebHome(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Row(children: [
        LeftPannel(
          user: user,
        ),
        createHomeBody(context)
      ]),
    )));
  }

  Widget createAndroidHome(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(children: [createHomeBody(context)]),
            bottomNavigationBar: AndroidNavBar(
              user: user,
            )));
  }

  @override
  Widget build(BuildContext context) {
    if (isWeb()) {
      return createWebHome(context);
    }
    return createAndroidHome(context);
  }
}
