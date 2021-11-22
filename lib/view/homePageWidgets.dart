import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/model/movie.dart';
import 'package:flutter_testing/services/movieService.dart';
import 'package:flutter_testing/view/movieDetail.dart';
import 'package:flutter_testing/view/movieWidget.dart';

class HomePageWidgets extends StatefulWidget {
  const HomePageWidgets({Key? key}) : super(key: key);

  @override
  _HomePageWidgetsState createState() => _HomePageWidgetsState();
}

class _HomePageWidgetsState extends State<HomePageWidgets> {

  List<Movie> allOnePieceMovie = [];
  List<Movie> allBatManMovies = [];
  List<Movie> allRomanticMovies = [];
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();

  }

  Future<void> searchMoviesByName()async{
    final _allOnePieceMovie = await fetchAllMovies("One Piece");
    final _allBatManMovies = await fetchAllMovies("Batman");
    final _allRomanticMovies = await fetchAllMovies("Romantic");
    setState(() {
      allOnePieceMovie = _allOnePieceMovie;
      allBatManMovies = _allBatManMovies;
      allRomanticMovies = _allRomanticMovies;
    });
    setState(() {
      isLoaded = true;
    });
  }

  Future<void> getData()async{
    await searchMoviesByName();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded?Center(child: Text('Loading ...',style: TextStyle(color: Colors.white),),):SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('    Batman',style: TextStyle(color: Colors.grey)),
          Container(
            margin: const EdgeInsets.all(5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: allBatManMovies.map((e) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => FullMovieDetail(id: e.imdbID),));
                    },
                    child: Card(
                        color: Colors.black,
                        child: Container(
                          width: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: CachedNetworkImageBuilder(url: e.poster,builder: (image) => Image.file(image,),),
                              ),
                              SizedBox(height: 10,),
                              Text(e.title,style: TextStyle(color: Colors.amber),),
                            ],
                          ),
                        )
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Text('    One Piece',style: TextStyle(color: Colors.grey)),
          Container(
            margin: const EdgeInsets.all(5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: allOnePieceMovie.map((e) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => FullMovieDetail(id: e.imdbID),));
                    },
                    child: Card(
                        color: Colors.black,
                        child: Container(
                          width: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: CachedNetworkImageBuilder(url: e.poster,builder: (image) => Image.file(image,),),
                              ),
                              SizedBox(height: 10,),
                              Text(e.title,style: TextStyle(color: Colors.amber),),
                            ],
                          ),
                        )
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Text('    Romance',style: TextStyle(color: Colors.grey)),
          Container(
            margin: const EdgeInsets.all(5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: allRomanticMovies.map((e) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => FullMovieDetail(id: e.imdbID),));
                    },
                    child: Card(
                        color: Colors.black,
                        child: Container(
                          width: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: CachedNetworkImageBuilder(url: e.poster,builder: (image) => Image.file(image,),),
                              ),
                              SizedBox(height: 10,),
                              Text(e.title,style: TextStyle(color: Colors.amber),),
                            ],
                          ),
                        )
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
