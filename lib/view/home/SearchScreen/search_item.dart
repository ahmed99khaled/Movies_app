import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movies_app/core/style/my_theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/model/Results.dart';
import '../../../core/model/search/Results.dart';

class SearchItem extends StatelessWidget {
  Result results;
  SearchItem({required this.results});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
         _launchUrl(Uri.parse('https://cima4u.rocks'));
      },
      child: Container(
        margin:EdgeInsets.all(12),
        child:Row(
          children:[
            ClipRRect(
              borderRadius:BorderRadius.circular(10),
              child: CachedNetworkImage(
                height: 100,
                width: 160,
                imageUrl: 'https://image.tmdb.org/t/p/w500' +
                    '${results.backdropPath}',
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
                  Text(results.title??'',
                    style:TextStyle(fontSize:15,color:Colors.white),
                  ),
                  SizedBox(height:10,),
                  Text(results.releaseDate??'',
                    style:TextStyle(fontSize:15,color:MyTheme.lightBlack2),
                  ),
                  SizedBox(height:10,),
                  Text(results.originalLanguage??'',
                    style:TextStyle(fontSize:15,color:MyTheme.lightBlack2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
