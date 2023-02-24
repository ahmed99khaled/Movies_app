 import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/model/MovieDiscover/Results.dart';

import '../../../core/style/my_theme.dart';

class MovieDiscoverItem extends StatelessWidget {
  ResultDiscover? resultDiscover;
  MovieDiscoverItem(this.resultDiscover);
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
                  '${resultDiscover!.backdropPath}',
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
                Text(resultDiscover!.title??'',
                  style:TextStyle(fontSize:15,color:Colors.white),
                ),
                SizedBox(height:10,),
                Text(resultDiscover!.releaseDate??'',
                  style:TextStyle(fontSize:15,color:MyTheme.lightBlack2),
                ),
                SizedBox(height:10,),
                Text(resultDiscover!.originalLanguage??'',
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
