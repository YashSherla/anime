import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pratice_app/anime/model/anime_model.dart';

class Api {
  Future<Homepage> getdata() async {
    String api = 'https://api-aniwatch.onrender.com/anime/home';

    var url = Uri.parse(api);
    final res = await http.get(url);

    if (res.statusCode == 200) {
      return Homepage.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to load homepage');
    }
  }
}
