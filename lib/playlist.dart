import 'song.dart';

class Playlist {
  int playlistId = 0;
  String name;
  String description = 'description';
  String playlistType = "Public Playlist";
  String owner = "Username";
  int likes = 0;
  int songsCount = 0;
  int minutes = 0;
  List<Song> songs = [Song()];
  Playlist({required this.name});
}
