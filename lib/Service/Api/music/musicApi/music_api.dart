

import 'package:dio/dio.dart';

import '../../../HttpRepuest/HttpRequest.dart';
import '../musicModel/music_model.dart';


class MusicListApi {


  static Future<MusicListModel> getListMusic(String name) async {
    try {
      String url = 'https://shazam.p.rapidapi.com/search';
      Map<String,dynamic> response = (await HttpRequest.get(url,
          params: {
            'term': name, 'locale': 'en-US', 'offset': '0', 'limit': '5'},
        options: Options(
            headers: {
              'X-RapidAPI-Key': 'ae3c5618b2mshda9a3a04a715ed2p1d0c34jsn57497060f272',
              'X-RapidAPI-Host': 'shazam.p.rapidapi.com'
            }
        )

      ));
      return MusicListModel.fromJson(response['tracks']);
    } catch (e) {
      rethrow;
    }
  }
}
