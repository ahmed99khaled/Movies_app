import 'package:flutter/material.dart';
import 'package:movies_app/core/model/PopularResponse.dart';
import 'package:movies_app/core/model/Results.dart';
import 'package:movies_app/view/home/newReleases/release_card_widget.dart';

import '../../../core/style/my_theme.dart';

class NewReleasesWidget extends StatelessWidget {
PopularResponse? popularResponse;
NewReleasesWidget({ this.popularResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(14),
      width:double.infinity,
      height:185,
      color:MyTheme.lightBlack3,
      child:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children:[
          Text('New Releases',
            style:TextStyle(
                color:Colors.white,
                fontSize:15,
                fontWeight:FontWeight.bold
            ),),
          SizedBox(height:8,),
          Expanded(
            child: ListView.builder(
                scrollDirection:Axis.horizontal,
                itemBuilder:(context, index) =>ReleaseCardWidget(index:index,popularResponse:popularResponse!),
                itemCount:popularResponse?.results?.length ),
          ),

        ],
      ),
    );
  }
}

//Card(
//  child: Center(child:Stack(
//   children: [
//   Container(
//   width:100,
//   height:175,
//      ),
//    ImageIcon(AssetImage('assets/images/bookmark.png'),),
//     ],
//  )),
// )