import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

import '../Sceen/AudioPlayerFile/boxPlayModel.dart';
import '../Service/Api/music/musicModel/music_model.dart';

class ProviderAudio with ChangeNotifier{

  bool? _isPlaying ;

  bool? get isPlaying => _isPlaying;

  set isPlaying(bool? isPlaying) {
    _isPlaying = isPlaying;

  }
  bool? _isPaused ;

  bool? get isPaused => _isPaused;

  set isPaused(bool? isPaused) {
    _isPaused = isPaused;

  }
  bool? _isLoop ;

  bool? get isLoop => _isLoop;

  set isLoop(bool? isLoop) {
    _isLoop = isLoop;

  }

  BoxPlayModel ?_boxPlays;

  BoxPlayModel ? get boxPlays => _boxPlays;

  set boxPlays(BoxPlayModel ? boxPlays) {
    _boxPlays = boxPlays;

  }
  MusicListModel ? _saveMusic;

  MusicListModel ? get saveMusic => _saveMusic;

  set saveMusic(MusicListModel ? saveMusic) {
    _saveMusic = saveMusic;

  }
}