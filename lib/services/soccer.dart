import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

import '../models/soccer.dart';

class SoccerApi {
  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2020&league=39";
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "45b6a2a72e8d06e2dd63dcac72c75294"
  };
  //'272395d57826bc9e537ff18d21c1824df

  Future<List<SoccerMatch>?> getAllMatches() async {
    var url = Uri.parse(apiUrl);
    Response res = await get(url, headers: headers);
    var body;
    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      print("Api Data");
      print(body['response']);
      List matchesList = body['response'];
      List<SoccerMatch>? matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();
      return matches;
    }
  }
}
