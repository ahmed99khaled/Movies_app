import 'package:flutter/material.dart';
import 'package:movies_app/core/style/my_theme.dart';
import 'package:movies_app/view/home/SearchScreen/search_item.dart';

import '../../../core/api/api_manager.dart';
import '../../../core/model/MovieInformationResponse.dart';
import '../../../core/model/search/Results.dart';
import '../../../core/model/search/SearchResponse.dart';

class SearchTab extends StatefulWidget {

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String query = '';
  List<Result>search = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
    Scaffold(
    appBar:AppBar(
      elevation:0,
      backgroundColor:MyTheme.primary,
    toolbarHeight: 70,
      leading: const SizedBox(),
      leadingWidth: 10,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 66,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: MyTheme.lightBlack,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: "Search",
              hintStyle: const TextStyle(color:Colors.grey,fontWeight:FontWeight.bold),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              contentPadding: const EdgeInsets.only(top: 10),
            ),
          ),
        ),
      ),
    ),
    body:query.isEmpty?Center(child: Image.asset('assets/images/no_movie.png')):ListView.builder(
    itemBuilder: (context, index) =>SearchItem(results:searchFun()[index]),
    itemCount:searchFun().length ,
    ),
    ),

    ],
    );
  }

  List searchFun() {
    ApiManager.getMovieSearch(query).
    then((searchResponse) {
      search = searchResponse.results ?? [];
    })
        .catchError((error) {
      print('big error$error');
    });
    return search;
  }
}
