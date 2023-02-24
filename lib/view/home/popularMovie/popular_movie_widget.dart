import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/database/movie.dart';
import 'package:movies_app/database/my_database.dart';
import 'package:movies_app/provider/configProvider.dart';
import 'package:movies_app/view/home/netwok_image.dart';
import 'package:movies_app/view/home/newReleases/release_card_widget.dart';
import 'package:provider/provider.dart';
import '../../../core/model/Results.dart';
import '../../../core/style/my_theme.dart';
import '../movieDetailsScreen/movie_details.dart';
class PopularMovieWidget extends StatelessWidget {
  Results results;
  PopularMovieWidget(this.results);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ConfigProvider>(context);
    return InkWell(
      onTap:(){
        Navigator.pushNamed(
            context,
            MovieDetailsScreen.routeName,
            arguments:results );
      },
      child: Column(
        children: [
          Container(
            width:double.infinity,
            height:230,
            //color:Colors.red,
            child: Stack(
              children:[
                Container(
                  width:double.infinity,
                  height:178,
                  child:CachedImageWidget(
                      results: results,
                      imageLink:'https://image.tmdb.org/t/p/w500' +'${results.backdropPath}'),
                ),
                Positioned(
                  bottom:0,
                  left:22,
                  child: Row(
                    crossAxisAlignment:CrossAxisAlignment.end,
                    children:[
                      Stack(
                        children: [
                          Container(
                            width:118,
                            height:170,
                            child:CachedImageWidget(
                                results: results,
                                imageLink:'https://image.tmdb.org/t/p/w500' +'${results.posterPath}'),
                          ),
                            InkWell(
                              onTap:(){
                                provider.selectMovie(results);
                                insert();
                              },
                                child:provider.idList.contains(results.id)
                                    ? Image.asset('assets/images/bookmark_true.png')
                                    :Image.asset('assets/images/bookmark.png')
                            ),

                        ],
                      ),
                      SizedBox(
                        width:14,
                      ),
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:[
                          Text(results.title??'',
                            style:TextStyle(
                                fontSize:15,
                                fontWeight:FontWeight.w500,
                                color:Colors.white),),
                          SizedBox(height:8,),
                          Text(results.releaseDate??'',
                            style:TextStyle(
                                fontSize:10,fontWeight:FontWeight.bold,
                                color:MyTheme.lightBlack) ,),
                          SizedBox(height:6,),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ),

        ],
      ),
    );
  }
  void insert()async{
    Movie movie=Movie(
        title:results.title ??'',
        language: results.originalLanguage ??'',
        date:results.releaseDate??'',
        path:results.backdropPath??'');
    await MyDatabase.insertMovie(movie);
  }
}
