// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../playlist_page/playlist_page.dart';
import '../playlist.dart';
import '../user.dart';

class PlaylistButton extends StatelessWidget {
  Playlist playlist;
  User user;
  PlaylistButton({super.key, required this.playlist, required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: 250,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, padding: EdgeInsets.all(0)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder) {
            return PlaylistPage(
              playlist: playlist,
              user: user,
            );
          }));
        },
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 10,
            children: [
              Text(playlist.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13))
            ],
          ),
        ),
      ),
    );
  }
}
