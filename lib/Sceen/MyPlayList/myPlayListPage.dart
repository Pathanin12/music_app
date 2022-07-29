
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Service/Api/music/musicModel/music_model.dart';
import 'package:music_app/Widjet/checkText.dart';
import 'package:music_app/Widjet/listAlbum.dart';
import 'package:provider/provider.dart';
import '../../Ultility/constants.dart';
import '../../Ultility/audio.dart';
import '../AudioPlayerFile/audioListPlayer.dart';
import '../ListMusic/ListMusic.dart';

class playList extends StatefulWidget {
  const playList({Key? key}) : super(key: key);

  @override
  State<playList> createState() => _playListState();
}

class _playListState extends State<playList> {
  late List<Album> album;
  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();

    Audio.audioPlayer.dispose();
  }

  @override
  void initState() {



    // TODO: implement initState
    super.initState();

    album = listAlbum.getAlbum();
  }

  @override
  Widget build(BuildContext context) {
    final providerAudio = context.watch<ProviderAudio>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          // leading: Container(),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            child: const Text(
              'My PlayList',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          listPlay(),
          if (providerAudio.boxPlays != null)
            Align(
                alignment: Alignment.bottomCenter, child: audioPlayerFile(providerAudio.boxPlays!)),
        ],
      ),
    );
  }

  Future<void> loutPage(String name) async {
   var result=await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => listMusic(name)));
   if(result!=null){
     setState(() {
     });
   }else{
     setState(() {
     });
   }
   setState(() {

   });
  }

  Widget listPlay() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      // shrinkWrap: true,
      // physics: BouncingScrollPhysics(),
      itemCount: album.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            loutPage(album[index].name);
            //   // final body={
            //   //   "image":music!.hits![index].track!.share!.image,
            //   //   "name":music!.hits![index].track!.share!.subject,
            //   //   "uri":music!.hits![index].track!.hub!.actions![1].uri,
            //   //   "title":music!.hits![index].track!.subtitle
            //   // };
            //   boxPlays=BoxPlayModel.fromJson(body);
            //   setState(() {
            // });
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 1),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: NetworkImage(album[index].imageURL),
                        fit: BoxFit.cover),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${Check.checkText(album[index].name)}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${Check.checkText(album[index].title)}',
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
                  child: const Icon(
                    Icons.play_circle_outline_rounded,
                    size: 35,
                    color: Colors.grey,
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
