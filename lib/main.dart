import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/home.dart';
import './insert.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Home _home = new Home();
  
  @override
  Widget build(BuildContext context) {
    //final appTitle = 'Naja estoque';
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: appTitle,
      home: _home
      );
  }
}

