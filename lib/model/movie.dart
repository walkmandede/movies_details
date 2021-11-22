
class Movie{
  String imdbID;
  String poster;
  String title;
  String year;

  Movie({
    required this.imdbID,
    required this.poster,
    required this.year,
    required this.title});

  factory Movie.fromJson(Map<String,dynamic> json){
    return Movie(
        imdbID: json["imdbID"],
        poster: json["Poster"],
        year: json["Year"],
        title: json["Title"]);
  }

}