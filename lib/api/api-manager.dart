import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/sourceResponse.dart';

class ApiManager {
  static Future<SourceResponse?> getSources(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sorcesApi, {
      'apiKey': 'd1e4f5b1ae7a428280107f349caf63f6',
      'category': sourceId,
    });

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  /*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=d1e4f5b1ae7a428280107f349caf63f6
 */
  static Future<NewsResponse?> getNewsById(
      {required String sourceId,
      required String searchValue,
      required int page}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apiKey': 'd1e4f5b1ae7a428280107f349caf63f6',
      'sources': sourceId,
      'q': searchValue,
      'page': page.toString()
    });

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}

/*
d1e4f5b1ae7a428280107f349caf63f6
https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
 */
