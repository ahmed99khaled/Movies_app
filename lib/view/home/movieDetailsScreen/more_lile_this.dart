import 'package:flutter/material.dart';
import 'package:movies_app/core/model/PopularResponse.dart';

import '../../../core/style/my_theme.dart';
import '../netwok_image.dart';

class MoreLikeThisItem extends StatelessWidget {
  PopularResponse popularResponse;
  int index;
  MoreLikeThisItem({required this.popularResponse,required this.index});
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
                  height:200,
                  width:100,
                ),
                Container(
                  margin: EdgeInsets.only(right:15),
                  width: 100,
                  height: 150,
                  child: CachedImageWidget(
                      results: popularResponse.results![index],
                      imageLink: 'https://image.tmdb.org/t/p/w500' +
                          '${popularResponse.results![index].posterPath}'),
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
                          Text('${popularResponse.results![index].voteAverage}',
                              style:TextStyle(
                                  color:Colors.white
                              )),

                        ],
                      ),
                      Container(
                        width:100,
                        child: Text('${popularResponse.results![index].title}',
                          style:TextStyle(color:Colors.white,),

                        ),
                      ),
                      Text('${popularResponse.results![index].releaseDate}',
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
