import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:memelab/models/MemeResponse.model.dart';

abstract class API {
  static const String baseURL = 'https://api.imgflip.com';
  static Future<MemeResponse> getMemes() async {
    final response = await http.get(Uri.parse('$baseURL/get_memes'));
    if (response.statusCode == 200) {
      return MemeResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load memes');
    }
  }
}
