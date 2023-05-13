import 'package:flutter/material.dart';
import 'small_playlist.dart';
import '../../playlist.dart';

class GridPlaylists extends StatelessWidget {
  List playlists;
  GridPlaylists({super.key, required this.playlists});

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
                    SmallPlaylist(
                      playlist: Playlist(playlists[0]),
                    ),
                    Container(
                      width: 20,
                    ),
                    SmallPlaylist(
                      playlist: Playlist(playlists[1]),
                    )
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
                    SmallPlaylist(
                      playlist: Playlist(playlists[2]),
                    ),
                    Container(
                      width: 20,
                    ),
                    SmallPlaylist(
                      playlist: Playlist(playlists[3]),
                    )
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
                    SmallPlaylist(
                      playlist: Playlist(playlists[4]),
                    ),
                    Container(
                      width: 20,
                    ),
                    SmallPlaylist(
                      playlist: Playlist(playlists[5]),
                    )
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
                SmallPlaylist(
                  playlist: Playlist(playlists[0]),
                ),
                Container(
                  width: 20,
                ),
                SmallPlaylist(
                  playlist: Playlist(playlists[1]),
                ),
                Container(
                  width: 20,
                ),
                SmallPlaylist(
                  playlist: Playlist(playlists[2]),
                )
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
                SmallPlaylist(
                  playlist: Playlist(playlists[3]),
                ),
                Container(
                  width: 20,
                ),
                SmallPlaylist(
                  playlist: Playlist(playlists[4]),
                ),
                Container(
                  width: 20,
                ),
                SmallPlaylist(
                  playlist: Playlist(playlists[5]),
                )
              ],
            )),
      ]),
    );
  }
}
