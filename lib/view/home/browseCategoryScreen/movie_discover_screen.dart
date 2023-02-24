import 'package:flutter/material.dart';
import 'package:movies_app/core/model/BrowseCategory/Genres.dart';
import 'package:movies_app/core/model/MovieDiscover/MovieDiscoverResponse.dart';
import 'package:movies_app/view/home/browseCategoryScreen/movie_discover_item.dart';


import '../../../core/api/api_manager.dart';
import '../../../core/model/MovieDiscover/Results.dart';
import '../../../core/style/my_theme.dart';

class MovieDiscoverScreen extends StatelessWidget {
  static const String routeName='discover screen';
  Genre? genre;
  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)!.settings.arguments as Genre;

    return Scaffold(
      appBar:AppBar(
        elevation:0,
        backgroundColor:MyTheme.lightBlack3,
        title:Text('${args.name??''} Movie List'),
        centerTitle:true,
      ),
      body:FutureBuilder<MovieDiscoverResponse>(
        future:ApiManager.getMovieDiscover(genreName:args.id.toString()),
        builder:(context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data ${snapshot.error.toString()}',
                style:TextStyle(color:Colors.white),),
            );
          }
          if (snapshot.data?.code == 'error') {
            return Center(
              child: Text('Server error ${snapshot.data?.message}'),
            );
          }
          var resultDiscoverList=snapshot.data?.results;
          return ListView.builder(
            itemBuilder:(context, index) =>MovieDiscoverItem(resultDiscoverList![index]),
            itemCount:snapshot.data?.results?.length ,) ;

        },
      ),
    ) ;
  }
}

