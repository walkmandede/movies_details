
import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/model/movie.dart';
import 'package:flutter_testing/view/movieDetail.dart';

class MovieWidget extends StatelessWidget {

  final List<Movie> movies;
  const MovieWidget({required this.movies});


  @override
  Widget build(BuildContext context) {
    return movies.isEmpty?const Center(child: Text('No Movie Available',style: TextStyle(color: Colors.white),),):ListView(
      children: movies.map((e) {
        final movie = e;
        return ListTile(
          onTap: () {
            Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => FullMovieDetail(id: e.imdbID),));
          },
            title: Row(
              children: [
                SizedBox(
                  width: 100,
                  child:  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImageBuilder(url: movie.poster, builder: (image) => Image.file(image),),
                  ),
                ),
                Flexible(child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      Text(movie.year,style: TextStyle(fontSize: 12/MediaQuery.textScaleFactorOf(context),color: Colors.white),),
                    ],
                  ),
                ))
              ],
            )
        );
      }).toList(),);
  }
}
