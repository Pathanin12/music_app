import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Sceen/AudioPlayerFile/boxPlayModel.dart';
import 'package:music_app/Widjet/checkText.dart';
import 'package:provider/provider.dart';

import '../../Ultility/constants.dart';
import '../../Widjet/audio.dart';

class audioPlayerFile extends StatefulWidget {
  final BoxPlayModel boxPlay;
  const audioPlayerFile(this.boxPlay, {super.key});

  @override
  State<audioPlayerFile> createState() => _audioPlayerFileState();
}

class _audioPlayerFileState extends State<audioPlayerFile> {

  Duration duration=const Duration();
  Duration position=const Duration();
  @override
  void initState() {
    // TODO: implement initState
    loadAudio();

    super.initState();


    // setAudio();
  }
Future loadAudio()async{

  Audio.audioPlayer.onDurationChanged.listen((event) async{
    setState(() {
      print("*********--------------- $event");
      duration = event;
    });
  });
  Audio.audioPlayer.onAudioPositionChanged.listen((event) async{
    setState(() {
      position = event;
    });
  });
}
  @override
  Widget build(BuildContext context) {
    final providerAudio = context.watch<ProviderAudio>();

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SliderTheme(
            data: const SliderThemeData(
              trackHeight: 2,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius:0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 2),
              overlayColor: Colors.amber,
              thumbColor: Colors.amber
            ),
            child: Slider(
              activeColor: Colors.amber,
              thumbColor: Colors.amber,
              inactiveColor: Colors.grey[350],

              value: position.inSeconds.toDouble(),
              max: duration.inSeconds.toDouble(),
              onChanged: (double value) {},
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      image: NetworkImage('${widget.boxPlay.image}')),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${Check.checkText(widget.boxPlay.name)}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${Check.checkText(widget.boxPlay.title)}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 15),
                child: InkWell(
                  onTap: () {

                    providerAudio.isPlaying = !providerAudio.isPlaying!;
                    if (providerAudio.isPlaying!) {
                      Audio.audioPlayer.play(widget.boxPlay.uri.toString());
                    } else {
                      Audio.audioPlayer.pause();
                    }
                    setState(() {});
                  },
                  child: Icon(
                    (providerAudio.isPlaying == true)
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline_rounded,
                    size: 35,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

// setAudio(){
//   widget.audioPlayer!.onDurationChanged.listen((event) {
//     setState(() {
//       _duration=event;
//     });
//   });
//   widget.audioPlayer!.onAudioPositionChanged.listen((event) {
//     setState(() {
//       _position=event;
//     });
//   });
//   widget.audioPlayer!.setUrl(widget.boxPlay!.uri.toString());
// }
}
