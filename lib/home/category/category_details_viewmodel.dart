import 'package:flutter/material.dart';
import 'package:news_app/api/api-manager.dart';

import '../../model/sourceResponse.dart';
import '../../my_theme.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  //todo: hold Data - handle Logic
  List<Source>? sourcesList;
  String? errorMessage;

  void getSources(String sourceId) async {
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(sourceId);
      if (response?.status == 'error') {
        errorMessage = response!.message;
      } else {
        sourcesList = response!.sources;
      }
    } catch (e) {
      // TODO
      errorMessage = 'SomeThing Went Wrong';
    }
    notifyListeners();
  }
}
