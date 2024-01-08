import 'dart:convert';

import 'package:flutter_memer/models/memes_response.dart';
import 'package:http/http.dart' as http;

abstract class Api {
  static const getbaseUrl = 'https://api.imgflip.com';
  static Future<MemesData> getmemes() async {
    final response = await http.get(Uri.parse('$getbaseUrl/get_memes'));

    if (response.statusCode == 200) {
      final memesResponse = MemesResponse.fromJson(jsonDecode(response.body));
      return memesResponse.data!;
    } else {
      throw Exception('Failed to load memes');
    }
  }
}
