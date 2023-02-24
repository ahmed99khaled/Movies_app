

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/model/Results.dart';
import '../../../core/model/search/Results.dart';
import '../../../core/style/my_theme.dart';
import '../../../database/movie.dart';

class WatchListItem extends StatelessWidget {
  //Results results;
  Movie movie;
  WatchListItem({required this.movie});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(12),
      child:Row(
        children:[
          ClipRRect(
            borderRadius:BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: 100,
              width: 160,
              imageUrl: 'https://image.tmdb.org/t/p/w500' +
                  '${movie.path}',
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(width:10,),
          Container(
            width:160,
            height:100,
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Text(movie.title??'',
                  style:TextStyle(fontSize:15,color:Colors.white),
                ),
                SizedBox(height:10,),
                Text(movie.date??'',
                  style:TextStyle(fontSize:15,color:MyTheme.lightBlack2),
                ),
                SizedBox(height:10,),
                Text(movie.language??'',
                  style:TextStyle(fontSize:15,color:MyTheme.lightBlack2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
