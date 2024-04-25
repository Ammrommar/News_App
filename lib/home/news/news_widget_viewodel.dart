import 'package:flutter/material.dart';
import 'package:news_app/api/api-manager.dart';
import 'package:news_app/model/NewsResponse.dart';

class NewsWidgetViewModel extends ChangeNotifier {
  //todo: hold data -handle logic
  List<News>? newsList;
  String? errorMessage;

  void getNewsById(String sourceId, String searchValue, int page) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var reponse = await ApiManager.getNewsById(
          sourceId: sourceId, searchValue: searchValue, page: page);
      if (reponse?.status == 'ok') {
        newsList = reponse!.articles;
      } else {
        errorMessage = reponse!.message;
      }
    } catch (e) {
      // TODO
      errorMessage = 'SomeThing went Wrong';
    }
    notifyListeners();
  }
}
