import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';


Map audioData = {
  'url' : "https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/mp3file%2FRISE%20(ft.%20The%20Glitch%20Mob%2C%20Mako%2C%20and%20The%20Word%20Alive)%20%20Worlds%202018%20-%20League%20of%20Legends.mp3?alt=media&token=07cea5f2-eb24-4990-a75e-5458287886d9"
};

class Lol extends StatefulWidget {
  @override
  _LolState createState() => _LolState();
}

class _LolState extends State<Lol> {
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
        "https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/mp3file%2FRISE%20(ft.%20The%20Glitch%20Mob%2C%20Mako%2C%20and%20The%20Word%20Alive)%20%20Worlds%202018%20-%20League%20of%20Legends.mp3?alt=media&token=07cea5f2-eb24-4990-a75e-5458287886d9");
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
        "https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/mp3file%2FRISE%20(ft.%20The%20Glitch%20Mob%2C%20Mako%2C%20and%20The%20Word%20Alive)%20%20Worlds%202018%20-%20League%20of%20Legends.mp3?alt=media&token=07cea5f2-eb24-4990-a75e-5458287886d9");
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
                          image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/musicapp-73ddc.appspot.com/o/cover%2FRISE%20(ft.%20The%20Glitch%20Mob%2C%20Mako%2C%20and%20The%20Word%20Alive)%20%20Worlds%202018%20-%20League%20of%20Legends%202.jpg?alt=media&token=21e9ea1f-276f-4f68-8fee-fddeb5ee6080"),
                        )
                    ),
                  ),
                ),

                // SizedBox(height: 20.0,),
                Center(
                  child: Text(
                    "RISE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Text("League of Legends",
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

