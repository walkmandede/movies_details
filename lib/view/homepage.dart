import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_testing/model/movie.dart';
import 'package:flutter_testing/services/movieService.dart';
import 'package:flutter_testing/view/homePageWidgets.dart';
import 'package:flutter_testing/view/movieWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Movie> allMovies = [];
  TextEditingController txtSearchMovie = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    getData();

  }

  Future<void> searchMoviesByName(String serachedName)async{
    setState(() {
      allMovies.clear();
    });
    final movies = await fetchAllMovies(serachedName);
    setState(() {
      allMovies = movies;
    });
  }

  Future<void> getData()async{
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        txtSearchMovie.text = "";
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Text('Movies Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18/MediaQuery.textScaleFactorOf(context)),)),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: txtSearchMovie,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefix: Icon(Icons.search,color: Colors.white,),
                      ),
                      onSubmitted: (value) async{
                        searchMoviesByName(value);
                        },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: txtSearchMovie.text==""?const HomePageWidgets():MovieWidget(movies: allMovies,)
          )
        ],
      ),
    );
  }
}
