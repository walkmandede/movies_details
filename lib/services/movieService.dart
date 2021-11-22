import 'dart:convert';

import 'package:flutter_testing/model/movie.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchAllMovies(String searchString) async{
  var client = http.Client();
  var response = await client.get(Uri.parse("https://www.omdbapi.com/?s=$searchString&apikey=41fcf7b2"));
  if(response.statusCode==200)
  {
    final result = jsonDecode(response.body);
    Iterable list = result["Search"];
    return list.map((e) => Movie.fromJson(e)).toList();
  }
  else{
  throw Exception('Failed To Load Movies');
  }
}