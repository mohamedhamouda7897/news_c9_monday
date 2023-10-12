import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_c9_monday/models/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse> getSources() async {
    try {
      Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
          {"apiKey": "dc3d106e730c4256b8c275d9da58d090"});
      http.Response data = await http.get(url);
      var jsonData = jsonDecode(data.body);

      SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonData);
      return sourcesResponse;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
}
