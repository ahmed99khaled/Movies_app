import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/model/MovieInformationResponse.dart';
import 'package:movies_app/core/model/Results.dart';
import 'package:movies_app/view/home/popularMovie/popular_movie_widget.dart';
import '../../../core/style/my_theme.dart';
import '../netwok_image.dart';

class PopularMovieDetails extends StatelessWidget {
  MovieInformationResponse movieInformationResponse;

  PopularMovieDetails({required this.movieInformationResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(left:20),
      child: Row(
        children: [
          Container(
            width: 118,
            height: 200,
            //color:Colors.blueAccent,
            child: CachedNetworkImage(
              //height: 200,
              //width: double.infinity,
              imageUrl: 'https://image.tmdb.org/t/p/w500' +
                  '${movieInformationResponse.posterPath}',
              fit: BoxFit.fill,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 1.5,
                          crossAxisSpacing:1.5,
                          childAspectRatio: 2 / 1),
                      itemBuilder: (context, index) =>
                          Container(
                            decoration:BoxDecoration(
                              border:Border.all(
                                width:1.2,
                                color:MyTheme.lightBlack2
                              ),
                              borderRadius:BorderRadius.circular(10),
                            ),
                              child: Text(
                                  movieInformationResponse.genres![index].name ?? '',
                                style:TextStyle(color:Colors.white) ,)
                          ),
                      itemCount: movieInformationResponse.genres?.length,

                    ),
                  ),
                  Text(
                    movieInformationResponse.overview ?? '',
                    style: TextStyle(color: MyTheme.lightBlack2),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: MyTheme.gold,
                        size: 30,
                      ),
                      Text(
                        movieInformationResponse.voteAverage.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
