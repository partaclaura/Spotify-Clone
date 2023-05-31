class Playlist {
  int playlistId = 0;
  String name = "Playlist Name";
  String description = 'description';
  String playlistType = "Public Playlist";
  String owner = "Username";
  int likes = 0;
  int songsCount = 0;
  String duration = "";
  List songs = [];

  Playlist(Map playlistData) {
    playlistId = playlistData['id'];
    name = playlistData['name'];
    description = playlistData['description'];
    playlistType = playlistData['type'];
    owner = playlistData['owner'];
    likes = playlistData['likes'];
    songs = playlistData['songs'];
    songsCount = songs.length;
    // TODO: minutes
  }
}
