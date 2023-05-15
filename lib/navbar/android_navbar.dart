import 'package:flutter/material.dart';
import '../user.dart';
import '../home/home.dart';

class AndroidNavBar extends StatelessWidget {
  User user;
  AndroidNavBar({required this.user});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting, // Shifting
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music),
          label: 'Your Library',
          backgroundColor: Colors.black,
        ),
      ],
      onTap: (value) {
        switch (value) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (builder) {
              return Home(user: user);
            }));
        }
      },
    );
  }
}
