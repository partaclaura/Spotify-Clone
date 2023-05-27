import 'package:flutter/material.dart';
import 'nav_buttons.dart';
import '../user.dart';

class NavBar extends StatelessWidget {
  final User user;
  const NavBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.black,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NavigationButton(
            buttonName: 'Home',
            user: user,
          ),
          NavigationButton(
            buttonName: 'Search',
            user: user,
          ),
          NavigationButton(
            buttonName: 'Your library',
            user: user,
          ),
          Container(
            color: Colors.black,
            height: 20,
          ),
          NavigationButton(
            buttonName: 'Create Playlist',
            user: user,
          ),
          NavigationButton(
            buttonName: 'Liked Songs',
            user: user,
          )
        ],
      ),
    );
  }
}
