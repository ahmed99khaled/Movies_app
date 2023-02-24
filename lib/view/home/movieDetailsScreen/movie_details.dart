import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/view/home/movieDetailsScreen/popular_movie_details.dart';
import 'package:movies_app/view/home/netwok_image.dart';
import '../../../core/api/api_manager.dart';
import '../../../core/model/MovieInformationResponse.dart';
import '../../../core/model/PopularResponse.dart';
import '../../../core/model/Results.dart';
import '../../../core/style/my_theme.dart';
import 'more_like_this_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName='movie details screen';
  Results? results;

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)!.settings.arguments as Results;
        return Scaffold(
          appBar:AppBar(
            elevation:0,
            backgroundColor:MyTheme.lightBlack3,
            title:Text(args.title??''),
            centerTitle:true,
          ),
          body:SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Container(
                  width:double.infinity,
                  height:180,
                  child:CachedNetworkImage(
                    height:200,
                    width:double.infinity,
                    imageUrl:'https://image.tmdb.org/t/p/w500' +'${args.backdropPath}',
                    fit:BoxFit.fill,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20,top:15),
                  child: Text(args.title??'',
                    style:TextStyle(
                        fontSize:18,
                        fontWeight:FontWeight.w500,
                        color:Colors.white),),
                ),
                SizedBox(height:8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: Text(args.releaseDate??'',
                    style:TextStyle(
                        fontSize:12,fontWeight:FontWeight.bold,
                        color:MyTheme.lightBlack) ,),
                ),
                SizedBox(height:20,),
                Container(
                  height:200,
                  width:double.infinity,
                  child: FutureBuilder<MovieInformationResponse>(
                    future:ApiManager.getMovieInformation(movieId:args.id!),
                    builder:(context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error loading data ${snapshot.error.toString()}'),
                        );
                      }
                      if (snapshot.data?.code == 'error') {
                        return Center(
                          child: Text('Server error ${snapshot.data?.message}'),
                        );
                      }
                      var informationList=snapshot.data;
                      return PopularMovieDetails(movieInformationResponse:informationList!);

                    },
                  ),
                ),
                SizedBox(height:10,),
                FutureBuilder<PopularResponse>(
                  future:ApiManager.getPopularMovie(),
                  builder:(context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error loading data ${snapshot.error.toString()}'),
                      );
                    }
                    if (snapshot.data?.code == 'error') {
                      return Center(
                        child: Text('Server error ${snapshot.data?.message}'),
                      );
                    }
                    //var resultsList=snapshot.data?.results;
                    return MoreLikeThisWidget(popularResponse:snapshot.data);

                  },
                ),



              ],
            ),
          ),
        );
      }

  }

