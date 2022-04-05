import 'package:flutter/material.dart';
import 'Home.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
const request = "https://api.hgbrasil.com/finance?format=json-cors&key=aefd0f5e";

void main() async {

  runApp( const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

Future<Map> getData() async{
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}