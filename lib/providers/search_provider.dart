import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  String searchValue = '';

  void updateSearchValue(String newSearchValue) {
    if (newSearchValue == '') {
      return;
    }
    searchValue = newSearchValue;
    notifyListeners();
  }
}
