import 'package:flutter/material.dart';
import 'nav_buttons.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.black,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NavigationButton(buttonName: 'Home'),
          NavigationButton(buttonName: 'Search'),
          NavigationButton(buttonName: 'Your library'),
          Container(
            color: Colors.black,
            height: 20,
          ),
          NavigationButton(buttonName: 'Create Playlist'),
          NavigationButton(buttonName: 'Liked Songs')
        ],
      ),
    );
  }
}
