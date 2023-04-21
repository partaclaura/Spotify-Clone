import 'package:flutter/material.dart';
import 'package:spotify_clone/home/playlists/grid_playlists.dart';

class TopPlaylists extends StatelessWidget {
  const TopPlaylists({super.key});

  String getMessage() {
    DateTime dateTime = DateTime.now();
    int currentHour = dateTime.hour;
    if (currentHour >= 5 && currentHour < 12) {
      return "Good morning";
    } else if (currentHour >= 12 && currentHour < 17) {
      return "Good afternoon";
    } else if (currentHour >= 17 && currentHour < 24) {
      return "Good evening";
    }
    return "Hello";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getMessage(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            GridPlaylists()
          ],
        ));
  }
}
