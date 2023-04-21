import 'package:flutter/material.dart';
import 'small_playlist.dart';

class GridPlaylists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 1250) {
      return Container(
        color: Colors.black38,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SmallPlaylist(),
                    Container(
                      width: 20,
                    ),
                    SmallPlaylist()
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SmallPlaylist(),
                    Container(
                      width: 20,
                    ),
                    SmallPlaylist()
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SmallPlaylist(),
                    Container(
                      width: 20,
                    ),
                    SmallPlaylist()
                  ],
                ),
              ),
            ]),
      );
    }
    return Container(
      color: Colors.black38,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallPlaylist(),
                Container(
                  width: 20,
                ),
                SmallPlaylist(),
                Container(
                  width: 20,
                ),
                SmallPlaylist()
              ],
            )),
        Container(
          height: 20,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallPlaylist(),
                Container(
                  width: 20,
                ),
                SmallPlaylist(),
                Container(
                  width: 20,
                ),
                SmallPlaylist()
              ],
            )),
      ]),
    );
  }
}
