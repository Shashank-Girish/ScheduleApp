import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/home.dart';
import 'package:untitled/input.dart';
import "package:path_provider/path_provider.dart";
import 'package:flutter/foundation.dart';
import 'data_i.dart';


Future main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(InfoAdapter());
  await Hive.openBox("Data");


  runApp(MaterialApp(
    //initialRoute: '/input',
    routes: {
      '/':(context)=>HomePage(),
      "/input":(context)=>InputPage(),

    },
  ));
}

