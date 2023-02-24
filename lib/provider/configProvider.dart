import 'package:flutter/material.dart';

import '../core/model/Results.dart';
import '../core/model/search/Results.dart';

class ConfigProvider extends ChangeNotifier{
  List<Results> watchList = [];
  List<num> idList = [];

  void selectMovie(Results resultMovie) {
    if (!idList.contains(resultMovie.id)) {
      watchList.add(resultMovie);
      idList.add(resultMovie.id!);
    } else if (idList.contains(resultMovie.id)) {
      watchList.remove(resultMovie);
      idList.remove(resultMovie.id);
    }
    notifyListeners();
  }
}