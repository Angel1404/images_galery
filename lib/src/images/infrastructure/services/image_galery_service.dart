import 'dart:convert';

import 'package:http/http.dart' as http;

class ImageGaleryService {
  Future<List<dynamic>> get({int page = 1, int perPage = 10}) async {
    try {
      final url = Uri.parse("https://api.unsplash.com/photos?page=$page&per_page=$perPage");
      final response = await http.get(url, headers: {"Authorization": "Client-ID egamuQD4Rsi0wKizZ5xqbq50IypyNlQckfOb64lOGQU"});

      if (response.statusCode == 200) {
        return json.decode(response.body) as List<dynamic>;
      }

      throw response.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
