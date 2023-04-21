// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'navbar/nav_bar.dart';
import 'playlists/playlists.dart';

class LeftPannel extends StatelessWidget {
  const LeftPannel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.black,
        child: Column(
          children: [
            NavBar(),
            Divider(
              color: Colors.grey,
              height: 0.1,
            ),
            Playlists(),
          ],
        ));
  }
}
