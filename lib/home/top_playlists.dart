import 'package:flutter/material.dart';
import 'package:spotify_clone/home/playlists/grid_playlists.dart';
import '../user.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class TopPlaylists extends StatefulWidget {
  User user;
  TopPlaylists({super.key, required this.user});

  @override
  _State createState() => _State();
}

class _State extends State<TopPlaylists> {
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

  int sortByClicks(dynamic a, dynamic b) {
    final propA = a['clicks'];
    final propB = b['clicks'];
    if (propA < propB) {
      return 1;
    } else if (propA > propB) {
      return -1;
    }
    return 0;
  }

  Future<List> getUserTopSixPlaylists() async {
    List userPlaylists = [];
    final String response =
        await rootBundle.loadString('assets/playlists.json');
    final data = await json.decode(response);
    setState(() {
      List users = data['users'];
      for (var u in users) {
        if (u['userId'] == widget.user.id) {
          userPlaylists = u['playlists'];
        }
      }
    });

    //userPlaylists.sort((a, b) {
    //  return b['clicks'].toString().compareTo(a['clicks'].toString());
    //});
    userPlaylists.sort(sortByClicks);

    return userPlaylists.take(6).toList();
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
            //GridPlaylists()
            FutureBuilder(
              future: getUserTopSixPlaylists(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) =>
                  snapshot.hasData
                      ? GridPlaylists(
                          playlists: snapshot.data!,
                        )
                      : Center(child: CircularProgressIndicator()),
            )
          ],
        ));
  }
}
