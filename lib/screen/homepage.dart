import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:use_api/model/beerfromjson.dart';
import 'package:use_api/services/beerDataService.dart';
import 'package:use_api/services/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  MissionDetailNewProvider provider = MissionDetailNewProvider(beerDataService: BeerDataService()) ;
  
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => provider,
      child: ChangeNotifierProvider<MissionDetailNewProvider>(
        create: (context) => provider..fetchMissionDetail(),
        child: Consumer<MissionDetailNewProvider>(builder: (context, value, child) {
          return Scaffold(
            body: Text(value.model?.imageUrl??''),
          );
        },),
      ),
    );

    // var beerData = Provider.of<BeerDataModel>(context);
    // int id = beerData.id;
    // String name = beerData.name;
    // String description = beerData.description;
    // String ImageUrl = beerData.imageUrl;
    // return Consumer<BeerDataModel>(
    //   builder: (context, data, _) {
    //     print(data.name);
    //     return Scaffold(
    //       body: Column(
    //         children: [
    //           // Image.network(Provider.of<BeerDataModel>(context).imageUrl),
    //           // Image.network(ImageUrl)
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
