import 'dart:convert';

class MusicModel {
  final String songname;
  final String artist;
  final String cover;

  MusicModel({
    this.songname,
    this.artist,
    this.cover
});

  MusicModel copyWith({
  String songname,
    String artist,
    String cover,
})
  {
    return MusicModel(
      songname: songname ?? this.songname,
      artist: artist ?? this.artist,
      cover: cover ?? this.cover
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'songname': songname,
      'artist': artist,
      'cover': cover
    };
  }

  factory MusicModel.fromMap(Map<String, dynamic> map){
    if (map == null) return null;

    return MusicModel(
      songname: map['songname'],
      artist: map['artist'],
      cover: map['cover']
    );
  }

  String toJson() => json.encode(toMap());

  factory MusicModel.fromJson(String source) => MusicModel.fromMap(json.decode(source));

  @override
  String toString() => 'MusicModel(songname: $songname, cover: $cover, artist: $artist)';

  @override
  bool operator == (Object o){
    if (identical(this, o)) return true;

    return o is MusicModel &&
    o.songname == songname &&
        o.artist == artist &&
    o.cover == cover;
  }
}