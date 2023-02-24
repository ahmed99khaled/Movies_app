import 'package:flutter/material.dart';
import 'package:movies_app/core/model/BrowseCategory/BrowseCategoryResponse.dart';
import 'package:movies_app/view/home/browseCategoryScreen/browse_category_widget.dart';

import '../../../core/api/api_manager.dart';

class BrowseTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading:Text(''),
        backgroundColor:Colors.transparent,
        elevation:0,
      ),
      body:Container(

        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Text('Browse Category',
                style:TextStyle(
                    fontSize:22,
                    fontWeight: FontWeight.bold,
                    color:Colors.white
                ) ,
              ),
            ),
            SizedBox(height:20,),
            FutureBuilder<BrowseCategoryResponse>(
              future:ApiManager.getBrowseCategory(),
              builder:(context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error loading data ${snapshot.error.toString()}'),
                  );
                }
                if (snapshot.data?.code == 'error') {
                  return Center(
                    child: Text('Server error ${snapshot.data?.message}'),
                  );
                }
                var genresList=snapshot.data?.genres;
                return Expanded(
                  child:  GridView.builder(
                   padding: EdgeInsets.only(left:20),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 15,
                        childAspectRatio: 2 / 1),
                    itemBuilder: (context, index) =>BrowseCategoryWidget(genresList![index]),
                    itemCount:snapshot.data?.genres?.length ,
                  ),
                ) ;

              },
            ),

          ],
        ),
      ),
    );
  }
}
//ListView.builder(
//                       itemBuilder:(context, index) =>BrowseCategoryWidget(genresList![index]),
//                       itemCount:snapshot.data?.genres?.length ,),