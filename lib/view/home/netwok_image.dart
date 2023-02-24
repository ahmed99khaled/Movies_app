import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/model/Results.dart';

class CachedImageWidget extends StatelessWidget {
Results results;
String imageLink;
CachedImageWidget({required this.results,required this.imageLink});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height:200,
      width:double.infinity,
      imageUrl:imageLink,
      fit:BoxFit.fill,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

//'https://image.tmdb.org/t/p/w500' +'${results.backdropPath}'