// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class PlaylistButton extends StatelessWidget {
  String playlistName;
  PlaylistButton({super.key, required this.playlistName});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: 250,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, padding: EdgeInsets.all(0)),
        onPressed: () {},
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 10,
            children: [
              Text(playlistName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13))
            ],
          ),
        ),
      ),
    );
  }
}
