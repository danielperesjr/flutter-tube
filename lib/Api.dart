import 'package:flutter_tube/model/Video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const YOUTUBE_API_KEY = "AIzaSyCfUDpSxWItiafBHfkTY-CNEjpFERMhlog";
const CHANNEL_ID = "UCwXdFgeE9KYzlDdR7TG9cMw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(
        Uri.parse(
            URL_BASE + "search"
                "?part=snippet"
                "&type=video"
                "&maxResults=20"
                "&order=date"
                "&key=$YOUTUBE_API_KEY"
                "&channelId=$CHANNEL_ID"
                "&q=$pesquisa"
        ));
    Map<String, dynamic> dadosJson = json.decode(response.body);
    List<Video> videos = dadosJson["items"].map<Video>(
            (map) {
          return Video.fromJson(map);
        }
    ).toList();
    return videos;
  }
}