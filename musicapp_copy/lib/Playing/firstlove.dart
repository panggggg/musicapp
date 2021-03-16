import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';


Map audioData = {
  'url' : "https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/mp3file%2F%E0%B8%95%E0%B9%89%E0%B8%AD%E0%B8%87%E0%B8%8A%E0%B8%AD%E0%B8%9A%E0%B9%81%E0%B8%84%E0%B9%88%E0%B9%84%E0%B8%AB%E0%B8%99%20(FIRST%20LOVE)%20-%20PRETZELLE.mp3?alt=media&token=68442fe5-e39f-4f18-bca2-b769237bbb46"
};

class FirstLove extends StatefulWidget {
  @override
  _FirstLoveState createState() => _FirstLoveState();
}

class _FirstLoveState extends State<FirstLove> {
  double sliderValue = 2;
  AudioPlayer audioPlayer = AudioPlayer();

  Duration totalDuration;
  Duration position;
  String audioState;

  Widget slider(){
    return Container(
        width: 250.0,
        child: Slider.adaptive(
          onChanged:(null),
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: totalDuration.inSeconds.toDouble(),
        )
    );
  }

  initAudio() {
    audioPlayer.play(
        "https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/mp3file%2F%E0%B8%95%E0%B9%89%E0%B8%AD%E0%B8%87%E0%B8%8A%E0%B8%AD%E0%B8%9A%E0%B9%81%E0%B8%84%E0%B9%88%E0%B9%84%E0%B8%AB%E0%B8%99%20(FIRST%20LOVE)%20-%20PRETZELLE.mp3?alt=media&token=68442fe5-e39f-4f18-bca2-b769237bbb46");
    audioPlayer.onDurationChanged.listen((updatedDuration) {
      setState(() {
        totalDuration = updatedDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((updatedPosition) {
      setState(() {
        position = updatedPosition;
      });
    });

    audioPlayer.onPlayerStateChanged.listen((playState) {
      if (playState == AudioPlayerState.STOPPED)
        audioState = "Stopped";
      if (playState == AudioPlayerState.PLAYING)
        audioState = "Playing";
      if (playState == AudioPlayerState.PAUSED)
        audioState = "Pause";

      setState(() {

      });
    });
  }

  void initState() {
    initAudio();
    super.initState();
  }

  playAudio() {
    audioPlayer.play(
        "https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/mp3file%2F%E0%B8%95%E0%B9%89%E0%B8%AD%E0%B8%87%E0%B8%8A%E0%B8%AD%E0%B8%9A%E0%B9%81%E0%B8%84%E0%B9%88%E0%B9%84%E0%B8%AB%E0%B8%99%20(FIRST%20LOVE)%20-%20PRETZELLE.mp3?alt=media&token=68442fe5-e39f-4f18-bca2-b769237bbb46");
  }


  pauseAudio() {
    audioPlayer.pause();
  }

  stopAudio() {
    audioPlayer.stop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey[900],
                Colors.black26,
              ]
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 0.0, top: 30.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 20.0),
                //   child:
                //   Text("Fung Pleng Gun",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 38.0,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding:  EdgeInsets.only(left: 30.0),
                //   child: Text(
                //     "Listen Your Favourite Music",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 24.0,
                //       fontWeight: FontWeight.w400,
                //     ),
                //   ),
                // ),
                Container(
                  child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/backhome');
                      },
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                        size: 20.0,)
                  ),
                ),
                SizedBox(height: 30.0,),
                Center(
                  child: Container(
                    width: 300.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                          image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2F%E0%B8%95%E0%B9%89%E0%B8%AD%E0%B8%87%E0%B8%8A%E0%B8%AD%E0%B8%9A%E0%B9%81%E0%B8%84%E0%B9%88%E0%B9%84%E0%B8%AB%E0%B8%99%20(FIRST%20LOVE)%20-%20PRETZELLE%202.jpg?alt=media&token=5a2f763e-93bf-466f-b84c-59e71d974200"),
                        )
                    ),
                  ),
                ),

                // SizedBox(height: 20.0,),
                Center(
                  child: Text(
                    "FIRST LOVE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Text("PRETZELLE",
                    style: TextStyle(fontSize: 25.0, color: Colors.white),),
                ),
                SizedBox(height: 50.0,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 500.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(position
                                  .toString()
                                  .split('.')
                                  .first),
                              slider(),
                              Text(totalDuration
                                  .toString()
                                  .split('.')
                                  .first),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.black,
                              onPressed: () {},
                              icon: Icon(
                                  Icons.skip_previous
                              ),
                            ),
                            IconButton(
                              iconSize: 62.0,
                              color: Colors.black,
                              onPressed: () {
                                playAudio();
                              },
                              icon: Icon(
                                  Icons.play_arrow
                              ),
                            ),
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.black,
                              onPressed: () {},
                              icon: Icon(
                                  Icons.skip_next
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

