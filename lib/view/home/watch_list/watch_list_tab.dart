import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/style/my_theme.dart';
import 'package:movies_app/database/movie.dart';
import 'package:movies_app/view/home/watch_list/watch_list_item.dart';
import 'package:provider/provider.dart';

import '../../../database/my_database.dart';
import '../../../provider/configProvider.dart';

class WatchListTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ConfigProvider>(context);
    return Scaffold(
      appBar:AppBar(
        leading:Text(''),
        backgroundColor:Colors.transparent,
        elevation:0,
      ),
      body:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children:[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child: Text('WatchList',
              style:TextStyle(
                  fontSize:22,
                  fontWeight: FontWeight.bold,
                  color:Colors.white
              ) ,
            ),
          ),
          Expanded(
            child:StreamBuilder(
              stream: MyDatabase.getMovieRealTimeUpdates(),
              builder: (buildContext, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapShot.hasError) {
                  return Center(child: Text('Something went wrong'));
                }
                var movies = snapShot.data?.docs.map((doc) => doc.data()).toList();
                return ListView.separated(
                  itemBuilder: (context, index) =>
                      WatchListItem(movie:movies![index]),
                  separatorBuilder:(context, index) =>
                      Container(width:double.infinity,height:1.4,color:MyTheme.lightBlack2,),
                  itemCount:provider.watchList.length
                );
              },
            )
            // ListView.separated(
            //     itemBuilder:(context, index) =>
            //         WatchListItem(results:provider.watchList[index]),
            //     separatorBuilder:(context, index) =>
            //         Container(width:double.infinity,height:1.4,color:MyTheme.lightBlack2,),
            //     itemCount:provider.watchList.length),
          )
        ],
      ),
    );
  }
}
