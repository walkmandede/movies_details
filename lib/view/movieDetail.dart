
import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/gloabls.dart';
import 'package:flutter_testing/model/fullMovie.dart';
import 'package:flutter_testing/model/movie.dart';
import 'package:flutter_testing/services/fullMovieService.dart';

class FullMovieDetail extends StatefulWidget {
  final String id;
  const FullMovieDetail({required this.id});

  @override
  _FullMovieDetailState createState() => _FullMovieDetailState();
}

class _FullMovieDetailState extends State<FullMovieDetail> {
  late FullMovie movie;
  bool isLoaded = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData()async
  {
    var _movie = await fetchThisMovie(widget.id);
    setState(() {
      movie = _movie;
    });
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded?const Scaffold(backgroundColor: Colors.black,body: Center(child: Text('Loading ...',style: TextStyle(color: Colors.white),),)):Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movie.title,style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
          onPressed: () => Navigator.of(context,rootNavigator: true).pop(),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          chipDesign(movie.imdbRating, Colors.blue, textColor: Colors.white)
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  child: ClipRRect(
                   borderRadius: BorderRadius.circular(16),
                   child: CachedNetworkImageBuilder(url: movie.poster, builder: (image) => Image.file(image),),
                  ),
                ),
              ),
              Divider(),
              TextField(
                enabled: false,
                maxLines: null,
                style: const TextStyle(color: Colors.white),
                controller: TextEditingController(text: movie.plot),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Plot',
                  labelStyle: TextStyle(color: Colors.grey)
                ),
              ),
              Divider(),
              TextField(
                enabled: false,
                maxLines: null,
                style: const TextStyle(color: Colors.white),
                controller: TextEditingController(text: movie.actors),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Actors',
                    labelStyle: TextStyle(color: Colors.grey)
                ),
              ),
              TextField(
                enabled: false,
                maxLines: null,
                style: const TextStyle(color: Colors.white),
                controller: TextEditingController(text: movie.director),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Directed By',
                    labelStyle: TextStyle(color: Colors.grey)
                ),
              ),
              TextField(
                enabled: false,
                maxLines: null,
                style: const TextStyle(color: Colors.white),
                controller: TextEditingController(text: movie.genre),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Genre',
                    labelStyle: TextStyle(color: Colors.grey)
                ),
              ),
              TextField(
                enabled: false,
                maxLines: null,
                style: const TextStyle(color: Colors.white),
                controller: TextEditingController(text: movie.awards),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Award',
                    labelStyle: TextStyle(color: Colors.grey)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


