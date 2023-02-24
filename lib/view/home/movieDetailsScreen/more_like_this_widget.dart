import 'package:flutter/material.dart';
import 'package:movies_app/core/model/PopularResponse.dart';

import '../../../core/style/my_theme.dart';
import 'more_lile_this.dart';

class MoreLikeThisWidget extends StatelessWidget {

PopularResponse? popularResponse;
MoreLikeThisWidget({ this.popularResponse});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(14),
      width:double.infinity,
      height:280,
      color:MyTheme.lightBlack3,
      child:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children:[
          Text('More Like This',
            style:TextStyle(
                color:Colors.white,
                fontSize:15,
                fontWeight:FontWeight.bold
            ),),
          SizedBox(height:8,),
          Expanded(
            child: ListView.builder(
                scrollDirection:Axis.horizontal,
                itemBuilder:(context, index) =>MoreLikeThisItem(
                    popularResponse: popularResponse!, index: index),
                itemCount:popularResponse?.results?.length ),
          ),




        ],
      ),
    );
  }
}
