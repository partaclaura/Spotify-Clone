// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  String buttonName;
  NavigationButton({super.key, required this.buttonName});

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
        onPressed: () {},
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
