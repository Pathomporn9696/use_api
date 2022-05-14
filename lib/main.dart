import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:use_api/screen/homepage.dart';
import 'package:use_api/services/beerDataService.dart';
import 'package:use_api/services/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => BeerDataService(),
          ),
          Provider(create: (context) => MissionDetailNewProvider),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
