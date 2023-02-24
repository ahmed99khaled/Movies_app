import 'package:flutter/material.dart';
import 'package:movies_app/core/model/RecomendedResponse.dart';
import 'package:movies_app/core/model/Results.dart';
import 'package:movies_app/view/home/netwok_image.dart';
import 'package:movies_app/view/home/recomendedMovie/recomended_movie_item.dart';

import '../../../core/style/my_theme.dart';

class RecomendedWidget extends StatelessWidget {
RecomendedResponse? recomendedResponses;

RecomendedWidget({required this.recomendedResponses});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(14),
      width:double.infinity,
      height:270,
      color:MyTheme.lightBlack3,
      child:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children:[
          Text('Recomended',
            style:TextStyle(
                color:Colors.white,
                fontSize:15,
                fontWeight:FontWeight.bold
            ),),
          SizedBox(height:8,),
          Expanded(
            child: ListView.builder(
                scrollDirection:Axis.horizontal,
                itemBuilder:(context, index) =>RecomendedMovieIteme(
                    index: index,
                    recomendedResponses:recomendedResponses!),
                itemCount:recomendedResponses?.results?.length ),
          ),




        ],
      ),
    );
  }
}
