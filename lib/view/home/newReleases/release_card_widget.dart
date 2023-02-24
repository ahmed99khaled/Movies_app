import 'package:flutter/material.dart';
import 'package:movies_app/core/model/PopularResponse.dart';
import 'package:movies_app/core/model/Results.dart';
import 'package:provider/provider.dart';

import '../../../provider/configProvider.dart';
import '../movieDetailsScreen/movie_details.dart';
import '../netwok_image.dart';

class ReleaseCardWidget extends StatelessWidget {
int index;
PopularResponse popularResponse;
ReleaseCardWidget({required this.popularResponse,required this.index});
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ConfigProvider>(context);
    return Card(
      child: Center(child:Stack(
        children: [
          InkWell(
            onTap:(){
              Navigator.pushNamed(
                  context,
                  MovieDetailsScreen.routeName,
                  arguments:popularResponse.results?[index] );
            },
            child: Container(
              width:100,
              height:220,
              child:CachedImageWidget(
                  results: popularResponse.results![index],
                  imageLink:'https://image.tmdb.org/t/p/w500'
                      +'${popularResponse.results![index].posterPath}'),
            ),
          ),
            InkWell(
              onTap:(){
                provider.selectMovie(popularResponse.results![index]);
              },
                child:provider.idList.contains(popularResponse.results![index].id)
                    ?Image.asset('assets/images/bookmark_true.png')
                    :Image.asset('assets/images/bookmark.png')),

        ],
      )),
    );
  }
}
