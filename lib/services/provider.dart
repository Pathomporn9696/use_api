import 'package:flutter/cupertino.dart';
import 'package:use_api/model/beerfromjson.dart';

import 'beerDataService.dart';

class MissionDetailNewProvider with ChangeNotifier {
  MissionDetailNewProvider({required this.beerDataService,});
  BeerDataService beerDataService;
  BeerDataModel? model;


  void fetchMissionDetail() async {
    try {
      notifyListeners();
      var response = await beerDataService.getBeerDataModel();
      model = response;
      await Future.delayed(Duration(milliseconds: 1500));
      notifyListeners();
    } catch (error) {
      notifyListeners();
      throw error;
    }
  }
}
