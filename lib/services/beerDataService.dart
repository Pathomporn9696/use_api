import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:use_api/model/beerfromjson.dart';

class BeerDataService with ChangeNotifier {

  String api ="https://api.punkapi.com/v2/beers/random";
  
  Future<BeerDataModel?> getBeerDataModel()async{
    final respones = await http.get(Uri.parse(api));
    if(respones.statusCode==200){
      var res = BeerDataModel.fromJson(jsonDecode(respones.body));
      return res;
    } else {
      return null;
    }
  }
}