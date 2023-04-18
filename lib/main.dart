// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'left_pannel.dart';

const List<String> categories = <String>['default', 'fruit', 'drinks'];
Map<String, String> shoppingList = {};
List<String> favourites = [];

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Row(children: [
        LeftPannel(),
        Expanded(child: Container(color: Colors.grey))
      ]),
    ));
  }
}
