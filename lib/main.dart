import 'package:flutter/material.dart';
import 'utils.dart' as utils;
import 'home_page.dart';

void main(){
  runApp(MaterialApp(
    color: utils.colorRed,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: utils.colorRed
    ),
    home: HomePage(),
  ));
}