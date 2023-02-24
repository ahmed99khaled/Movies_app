import 'package:flutter/material.dart';

import '../../../core/model/RecomendedResponse.dart';
import '../../../core/style/my_theme.dart';
import '../movieDetailsScreen/movie_details.dart';
import '../netwok_image.dart';

class RecomendedMovieIteme extends StatelessWidget {
  RecomendedResponse recomendedResponses;
  int index;

  RecomendedMovieIteme(
      {required this.index, required this.recomendedResponses});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Center(
            child: Stack(
          children: [
            Container(
              color:MyTheme.lightBlack,
              height:215,
              width:100,
            ),
            InkWell(
              onTap:(){
                Navigator.pushNamed(
                    context,
                    MovieDetailsScreen.routeName,
                    arguments:recomendedResponses.results?[index] );
              },
              child: Container(
                margin: EdgeInsets.only(right:15),
                width: 100,
                height: 140,
                child: CachedImageWidget(
                    results: recomendedResponses.results![index],
                    imageLink: 'https://image.tmdb.org/t/p/w500' +
                        '${recomendedResponses.results![index].posterPath}'),
              ),
            ),
            // ImageIcon(
            //   AssetImage('assets/images/bookmark.png'),
            // ),
            SizedBox(
              height: 8,
            ),
            Positioned(
              top:150,
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.star,
                        size:15,
                        color: MyTheme.gold,
                      ),
                      Text('${recomendedResponses.results![index].voteAverage}',
                          style:TextStyle(
                              color:Colors.white
                          )),

                    ],
                  ),
                  Container(
                    width:100,
                    child: Text('${recomendedResponses.results![index].title}',
                        style:TextStyle(color:Colors.white,),

                    ),
                  ),
                  Text('${recomendedResponses.results![index].releaseDate}',
                      style:TextStyle(
                          color:Colors.white
                      )),
                ],
              ),
            ),
          ],
        )),


      ],
    );
  }
}
