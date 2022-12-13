
import 'package:dailymed_search/models/daily-med-model.dart';
import 'package:flutter/cupertino.dart';

class DailyMedController extends ChangeNotifier{
  List<String> _searchFiles =[];
  DailyMedModel _dailyMedModel = DailyMedModel();
  bool loading = false;


  DailyMedModel get dailyMedModel => _dailyMedModel;

  set dailyMedModel(DailyMedModel value) {
    _dailyMedModel = value;
    notifyListeners();
  }

  List<String> get searchFiles => _searchFiles;

  set searchFiles(List<String> value) {
    _searchFiles = value;
  }
}