import 'package:flutter/material.dart';
import 'small_playlist.dart';
import '../../playlist.dart';
import '../../platform.dart';
import '../../user.dart';

class GridPlaylists extends StatelessWidget {
  List playlists;
  User user;
  GridPlaylists({super.key, required this.playlists, required this.user});

  double setHorizontalSpacing() {
    return isWeb() ? 10 : 5;
  }

  double setVerticalSpacing() {
    return isWeb() ? 20 : 5;
  }

  Widget createShortRow() {
    return Row(
      children: [
        SmallPlaylist(
          playlist: Playlist(playlists[0]),
          user: user,
        ),
        Container(
          width: setVerticalSpacing(),
        ),
        SmallPlaylist(
          playlist: Playlist(playlists[1]),
          user: user,
        )
      ],
    );
  }

  Widget createLongRow() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmallPlaylist(
          playlist: Playlist(playlists[3]),
          user: user,
        ),
        Container(
          width: 20,
        ),
        SmallPlaylist(
          playlist: Playlist(playlists[4]),
          user: user,
        ),
        Container(
          width: 20,
        ),
        SmallPlaylist(
          playlist: Playlist(playlists[5]),
          user: user,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 1250) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: createShortRow(),
              ),
              Container(
                height: setHorizontalSpacing(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: createShortRow(),
              ),
              Container(
                height: setHorizontalSpacing(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: createShortRow(),
              ),
            ]),
      );
    }
    return Container(
      //color: Colors.black38,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            width: MediaQuery.of(context).size.width, child: createLongRow()),
        Container(
          height: 20,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width, child: createLongRow()),
      ]),
    );
  }
}
