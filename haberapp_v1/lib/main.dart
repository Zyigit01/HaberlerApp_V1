
import 'package:haberapp_v1/constants/sabitler.dart';
import 'package:haberapp_v1/pages/haber.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:RenkSabitleri.temaRengi,
        visualDensity:VisualDensity.adaptivePlatformDensity 
      ),
      home: Haberler(),
    );
  }
}