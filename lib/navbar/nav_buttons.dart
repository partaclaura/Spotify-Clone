// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import '../user.dart';
import '../home/home.dart';
import '../playlist_page/playlist_page.dart';
import '../playlist.dart';

class NavigationButton extends StatelessWidget {
  String buttonName;
  User user;
  NavigationButton({super.key, required this.buttonName, required this.user});

  IconData matchButtonIcon() {
    if (buttonName == 'Home') {
      return Icons.home;
    } else if (buttonName == 'Search') {
      return Icons.search;
    } else if (buttonName == 'Create Playlist') {
      return Icons.add;
    } else if (buttonName == 'Liked Songs') {
      return Icons.favorite;
    }
    return Icons.library_music;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, padding: EdgeInsets.all(0)),
        onPressed: () {
          if (buttonName == "Home") {
            Navigator.push(context, MaterialPageRoute(builder: (builder) {
              return Home(user: user);
            }));
          } else if (buttonName == "Liked Songs") {
            Navigator.push(context, MaterialPageRoute(builder: (builder) {
              return PlaylistPage(
                playlist: Playlist({
                  "id": 55555,
                  "name": "Liked Songs",
                  "description": "",
                  "type": "uniquely_yours",
                  "owner": "user",
                  "likes": 1,
                  "songs": user.likedSongs
                }),
                user: user,
              );
            }));
          }
        },
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 10,
            children: [
              Icon(matchButtonIcon()),
              Text(buttonName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15))
            ],
          ),
        ),
      ),
    );
  }
}
