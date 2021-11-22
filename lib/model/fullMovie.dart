// To parse required this JSON data, do
//
//     final fullMovie = fullMovieFromJson(jsonString);

import 'dart:convert';

FullMovie fullMovieFromJson(String str) => FullMovie.fromJson(json.decode(str));

String fullMovieToJson(FullMovie data) => json.encode(data.toJson());

class FullMovie {
  FullMovie({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.ratings,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    required this.dvd,
    required this.boxOffice,
    required this.production,
    required this.website,
    required this.response,
  });

  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  List<Rating> ratings;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String imdbId;
  String type;
  String dvd;
  String boxOffice;
  String production;
  String website;
  String response;

  factory FullMovie.fromJson(Map<String, dynamic> json) => FullMovie(
    title: json["Title"]??"No Data",
    year: json["Year"]??"No Data",
    rated: json["Rated"]??"No Data",
    released: json["Released"]??"No Data",
    runtime: json["Runtime"]??"No Data",
    genre: json["Genre"]??"No Data",
    director: json["Director"]??"No Data",
    writer: json["Writer"]??"No Data",
    actors: json["Actors"]??"No Data",
    plot: json["Plot"]??"No Data",
    language: json["Language"]??"No Data",
    country: json["Country"]??"No Data",
    awards: json["Awards"]??"No Data",
    poster: json["Poster"]??"No Data",
    ratings: List<Rating>.from(json["Ratings"].map((x) => Rating.fromJson(x))),
    metascore: json["Metascore"]??"No Data",
    imdbRating: json["imdbRating"]??"No Data",
    imdbVotes: json["imdbVotes"]??"No Data",
    imdbId: json["imdbID"]??"No Data",
    type: json["Type"]??"No Data",
    dvd: json["DVD"]??"No Data",
    boxOffice: json["BoxOffice"]??"No Data",
    production: json["Production"]??"No Data",
    website: json["Website"]??"No Data",
    response: json["Response"]??"No Data",
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Year": year,
    "Rated": rated,
    "Released": released,
    "Runtime": runtime,
    "Genre": genre,
    "Director": director,
    "Writer": writer,
    "Actors": actors,
    "Plot": plot,
    "Language": language,
    "Country": country,
    "Awards": awards,
    "Poster": poster,
    "Ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
    "Metascore": metascore,
    "imdbRating": imdbRating,
    "imdbVotes": imdbVotes,
    "imdbID": imdbId,
    "Type": type,
    "DVD": dvd,
    "BoxOffice": boxOffice,
    "Production": production,
    "Website": website,
    "Response": response,
  };
}

class Rating {
  Rating({
    required this.source,
    required this.value,
  });

  String source;
  String value;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    source: json["Source"],
    value: json["Value"],
  );

  Map<String, dynamic> toJson() => {
    "Source": source,
    "Value": value,
  };
}
