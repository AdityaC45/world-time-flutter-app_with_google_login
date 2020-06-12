import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_time/login.dart';
import 'package:world_time/home.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Login(),
        '/loading':(context)=>Loading(),
        '/home':(context)=>Home(),
        '/location':(context)=>ChooseLocation()
      },
    );
  }
}


