import 'package:flutter/material.dart';

import '../../../core/model/BrowseCategory/Genres.dart';
import 'movie_discover_screen.dart';

class BrowseCategoryWidget extends StatelessWidget {
 Genre genres;
 BrowseCategoryWidget(this.genres);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.pushNamed(context,MovieDiscoverScreen.routeName,arguments:genres);
      },
      child: Stack(
        children:[
          Image.asset('assets/images/browse_image.png'),
          Positioned(
            child: Align(
              alignment:Alignment.center,
              child: Text(genres.name??'',
                style:TextStyle(color:Colors.white,fontWeight:FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
