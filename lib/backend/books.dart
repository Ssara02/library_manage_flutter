import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class BooksHelper {
  String baseURL = "http://localhost:8000/api/books/";
  Future<List> index() async {
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body);
      }
      return Future.error(jsonDecode(response.body));
    } catch (e) {
      log('Error in index function $e');
      return Future.error(e);
    }
  }
}
