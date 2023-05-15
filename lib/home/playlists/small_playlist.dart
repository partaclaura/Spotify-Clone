import 'package:flutter/material.dart';
import '../../playlist.dart';
import '../../platform.dart';
import '../../user.dart';
import '../../playlist_page/playlist_page.dart';

class SmallPlaylist extends StatelessWidget {
  Playlist playlist;
  User user;
  SmallPlaylist({required this.playlist, required this.user});

  double setWidth(BuildContext context) {
    if (isWeb()) {
      if (MediaQuery.of(context).size.width > 1100 &&
          MediaQuery.of(context).size.width < 1250) {
        return MediaQuery.of(context).size.width / 4;
      } else if (MediaQuery.of(context).size.width < 1100) {
        return MediaQuery.of(context).size.width / 6;
      } else {
        return MediaQuery.of(context).size.width / 6;
      }
    }
    return 112;
  }

  double setSize() {
    if (isWeb()) {
      return 70;
    }
    return 55;
  }

  double setFontSize() {
    return isWeb() ? 15 : 12;
  }

  double setPadding() {
    return isWeb() ? 25 : 20;
  }

  @override
  Widget build(BuildContext context) {
    double size = setSize();
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder) {
            return PlaylistPage(
              user: user,
              playlist: playlist,
            );
          }));
        },
        child: Container(
            height: size,
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5))),
                  width: size,
                ),
                Container(
                    height: size,
                    width: setWidth(context),
                    padding: EdgeInsets.symmetric(
                        vertical: setPadding(), horizontal: 6),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(44, 44, 52, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: Text(
                      playlist.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: setFontSize(),
                          color: Colors.white),
                    ))
              ],
            )));
  }
}
