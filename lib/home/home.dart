// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../left_pannel.dart';
import 'top_playlists.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Row(children: [
        LeftPannel(),
        Expanded(
            child: Container(
          color: Color.fromRGBO(26, 26, 26, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [TopPlaylists()],
          ),
        ))
      ]),
    ));
  }
}
