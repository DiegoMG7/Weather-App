import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/today.dart';
import 'package:weatherapp/start.dart';



class App extends StatelessWidget
{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: Start());
  }
}