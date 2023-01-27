import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_flutter/model/Video.dart';


const CHAVE_YOUTUBE_API = "AIzaSyD1pk2AFjHx9eds_j8HceR6XT8_bFxlqjw";
const ID_CANAL = "UC5ByFaspF1QNZ3RjWutu6Dg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";


class Api {
  pesquisar(String pesquisa) async {
    http.Response response = await http.get(
        "${URL_BASE}search?part=snippet&type=video&maxResults=20&order=date&key=$CHAVE_YOUTUBE_API&q=$pesquisa");

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
        //return Video.converterJson(map);
      }).toList();

      for (var video in videos) {
        print("resultado: ${video.titulo}");
      }
      //print("Resultado: " + videos.toString() );

      /*
      for( var video in dadosJson["items"] ){
        print("Resultado: " + video.toString() );
      }*/
      //print("resultado: " + dadosJson["items"].toString() );

    } else {}
  }
}
