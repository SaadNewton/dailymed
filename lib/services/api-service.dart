import 'dart:convert';

import 'package:dailymed_search/controllers/daily-med-provider.dart';
import 'package:provider/provider.dart';

import '../models/daily-med-model.dart';
import 'package:http/http.dart' as http;

class ApiService{

  Future<DailyMedModel> fetchMedList(context)async{
    DailyMedController dailyMedController = Provider.of<DailyMedController>(context,listen: false);
    dailyMedController.loading = true;
    // dailyMedController.notifyListeners();
    String Url = 'https://dailymed.nlm.nih.gov/dailymed/services/v2/drugclasses.json';
    final response = await http.get(Uri.parse(Url));
    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      final listResult = DailyMedModel.fromJson(json);

      dailyMedController.dailyMedModel = listResult;
      // dailyMedController.notifyListeners();
      print('daily model list -->> ${dailyMedController.dailyMedModel.data![0].name}');
      print('data of list get -->> ${listResult.data}');
      listResult.data!.forEach((element) {
        dailyMedController.searchFiles.add(element.name!);
        print("element in the service files are ${element.name}");
      });
      // dailyMedController.loading = false;
      // dailyMedController.notifyListeners();
      return listResult;


    }else throw Exception('Error in getting list');
  }
}