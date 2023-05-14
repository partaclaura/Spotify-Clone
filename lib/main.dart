// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'home/home.dart';
import 'playlist_page/playlist_page.dart';
import 'playlist.dart';
import 'user.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState get createState => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Map> initUser(int userId) async {
    Map user = {};
    final String response = await rootBundle.loadString('assets/users.json');
    final data = await json.decode(response);
    setState(() {
      List users = data['users'];
      for (var crtUser in users) {
        if (crtUser['id'] == userId) {
          user = crtUser;
        }
        // TODO: missing user error handling
      }
    });
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: FutureBuilder(
                future: initUser(12345),
                builder: (BuildContext context, AsyncSnapshot<Map> snapshot) =>
                    snapshot.hasData
                        ? Home(
                            user: User(
                                id: snapshot.data!['id'],
                                username: snapshot.data!['username']))
                        : Center(
                            child: CircularProgressIndicator(),
                          ))));
  }
}
