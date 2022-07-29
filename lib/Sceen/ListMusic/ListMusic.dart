import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Sceen/AudioPlayerFile/boxPlayModel.dart';
import 'package:music_app/Service/Api/music/musicModel/music_model.dart';
import 'package:provider/provider.dart';
import '../../Service/Api/music/musicApi/music_api.dart';
import '../../Ultility/constants.dart';
import '../../Widjet/audio.dart';
import '../../Widjet/checkText.dart';
import '../../Widjet/shimmer.dart';

class listMusic extends StatefulWidget {
  final String name;

  const listMusic(this.name, {super.key});

  @override
  State<listMusic> createState() => _listMusicState();
}

class _listMusicState extends State<listMusic> {
  MusicListModel? music;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMusicPlayList();



  }

  Future loadMusicPlayList() async {
    await MusicListApi.getListMusic(widget.name).then((value) async {
      setState(() {
        music = value;
        print(jsonEncode(music));
      });
    });
  }

  onBlack() {
    Navigator.of(context).pop(1);
  }

  @override
  Widget build(BuildContext context) {
    final providerAudio = context.watch<ProviderAudio>();
    return WillPopScope(
      onWillPop: () async {
        onBlack();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if(providerAudio.boxPlays!=null)Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: double.infinity,
                  color: const Color(0xFF0D4E69),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              image: DecorationImage(
                                  image: NetworkImage('${providerAudio.boxPlays!.image}')),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${Check.checkText(providerAudio.boxPlays!.name)}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${Check.checkText(providerAudio.boxPlays!.title)}',
                                style: const TextStyle(color: Colors.white),
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
                                  Audio.audioPlayer.play(providerAudio.boxPlays!.uri.toString());
                                } else {
                                  Audio.audioPlayer.pause();
                                }
                                setState(() {});
                              },
                              child: Icon(
                                (providerAudio.isPlaying == true)
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 15),
                            child: InkWell(
                              onTap: () {

                               if(providerAudio.boxPlays!.index<providerAudio.saveMusic!.hits!.length-1){
                                 Audio.audioPlayer.pause();
                                 final body = {
                                   "image": providerAudio.saveMusic!.hits![providerAudio.boxPlays!.index+1].track!.share!.image,
                                   "name": providerAudio.saveMusic!.hits![providerAudio.boxPlays!.index+1].track!.share!.subject,
                                   "uri": providerAudio.saveMusic!.hits![providerAudio.boxPlays!.index+1].track!.hub!.actions![1].uri,
                                   "title": providerAudio.saveMusic!.hits![providerAudio.boxPlays!.index+1].track!.subtitle,
                                   "index": providerAudio.boxPlays!.index+1,
                                 };
                                 providerAudio.boxPlays = BoxPlayModel.fromJson(body);
                                 providerAudio.isPlaying = true;
                                 Audio.audioPlayer.play(
                                     providerAudio.saveMusic!.hits![providerAudio.boxPlays!.index].track!.hub!.actions![1].uri.toString());

                                 setState(() {});
                               }
                               else{
                                 Audio.audioPlayer.pause();
                                 final body = {
                                   "image": providerAudio.saveMusic!.hits![0].track!.share!.image,
                                   "name": providerAudio.saveMusic!.hits![0].track!.share!.subject,
                                   "uri": providerAudio.saveMusic!.hits![0].track!.hub!.actions![1].uri,
                                   "title": providerAudio.saveMusic!.hits![0].track!.subtitle,
                                   "index": 0,
                                 };
                                 providerAudio.boxPlays = BoxPlayModel.fromJson(body);
                                 providerAudio.isPlaying = true;
                                 Audio.audioPlayer.play(
                                     providerAudio.saveMusic!.hits![0].track!.hub!.actions![1].uri.toString());

                                 setState(() {});
                               }
                              },
                              child:const Icon(Icons.skip_next,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          )

                        ],
                      ),
                    ],
                  ),
                ),
                (music == null)
                    ? const Center(
                        child: shimmer(),
                      )
                    : Container(
                        color: const Color(0xFC246DAB),
                        height: (providerAudio.boxPlays!=null)?MediaQuery.of(context).size.height * 0.9:MediaQuery.of(context).size.height * 1,
                        width: double.infinity,
                        child: listPlay()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listPlay() {
    final providerAudio = context.watch<ProviderAudio>();
    return ListView.builder(
      padding: EdgeInsets.zero,
      // shrinkWrap: true,
      // physics: BouncingScrollPhysics(),
      itemCount: music!.hits!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            providerAudio.saveMusic=music;
            Audio.audioPlayer.pause();
            final body = {
              "image": music!.hits![index].track!.share!.image,
              "name": music!.hits![index].track!.share!.subject,
              "uri": music!.hits![index].track!.hub!.actions![1].uri,
              "title": music!.hits![index].track!.subtitle,
              "index": index,
            };
            providerAudio.boxPlays = BoxPlayModel.fromJson(body);
            providerAudio.isPlaying = true;
            Audio.audioPlayer.play(
                music!.hits![index].track!.hub!.actions![1].uri.toString());


            setState(() {});
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 1),
            color: (providerAudio.boxPlays != null &&
                providerAudio.boxPlays!.name ==
                        music!.hits![index].track!.share!.subject &&
                providerAudio.boxPlays!.index == index)
                ? const Color(0xDB4FA0E8)
                : const Color(0xFC246DAB),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                            image: NetworkImage(
                                '${music!.hits![index].track!.share!.image}'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    if (providerAudio.boxPlays != null &&
                        providerAudio.boxPlays!.name ==
                            music!.hits![index].track!.share!.subject &&
                        providerAudio.boxPlays!.index == index)
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: const Icon(
                          CupertinoIcons.chart_bar_alt_fill,
                          size: 20,
                          color: Colors.white,
                        ),
                      )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${Check.checkText(music!.hits![index].track!.share!.subject)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${Check.checkText(music!.hits![index].track!.subtitle)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 15),
                  child: const Icon(
                    Icons.list_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
