import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MyAudio extends ChangeNotifier{

  MyAudio(){
    initAudio();
  }

  Duration totalDuration;
  Duration position;
  String audioState;


  AudioPlayer audioPlayer = AudioPlayer();

  initAudio(){
    audioPlayer.onDurationChanged.listen((updatedDuration) {
        totalDuration = updatedDuration;
        notifyListeners();
    });

    audioPlayer.onAudioPositionChanged.listen((updatedPosition) {
        position = updatedPosition;
        notifyListeners();

    });

    audioPlayer.onPlayerStateChanged.listen((playState) {
      if (playState == AudioPlayerState.STOPPED)
        audioState = "Stopped";
      if (playState == AudioPlayerState.PLAYING)
        audioState = "Playing";
      if (playState == AudioPlayerState.PAUSED)
        audioState = "Pause";

      notifyListeners();
    });

  }

  playAudio() {
    audioPlayer.play('url');
  }


  pauseAudio() {
    audioPlayer.pause();
  }

  stopAudio() {
    audioPlayer.stop();
  }

}