import 'package:flutter/material.dart';

class SmallPlaylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double setWidth;
    if (MediaQuery.of(context).size.width > 1100 &&
        MediaQuery.of(context).size.width < 1250) {
      setWidth = MediaQuery.of(context).size.width / 4;
    } else if (MediaQuery.of(context).size.width < 1100) {
      setWidth = setWidth = MediaQuery.of(context).size.width / 6;
    } else {
      setWidth = setWidth = MediaQuery.of(context).size.width / 6;
    }
    return Container(
        height: 70,
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5))),
              width: 70,
            ),
            Container(
                height: 70,
                width: setWidth,
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(44, 44, 52, 1),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                child: const Text(
                  "Playlist Name",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ))
          ],
        ));
  }
}
