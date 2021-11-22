import 'dart:convert';

import 'package:flutter_testing/model/fullMovie.dart';
import 'package:flutter_testing/model/movie.dart';
import 'package:http/http.dart' as http;

Future<FullMovie> fetchThisMovie(String id) async{
  var client = http.Client();
  var response = await client.get(Uri.parse("https://www.omdbapi.com/?i=$id&plot=full&apikey=41fcf7b2"));
  if(response.statusCode==200)
  {
    final result = jsonDecode(response.body);
    return FullMovie.fromJson(result);
  }
  else{
  throw Exception('Failed To Load Movies');
  }
}