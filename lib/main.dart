import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_testing/view/homepage.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    getData();

  }


  Future<void> getData()async{

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
    );
  }
}