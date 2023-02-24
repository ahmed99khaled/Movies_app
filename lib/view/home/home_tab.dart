import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/extentions/check_theme.dart';
import 'package:movies_app/core/model/RecomendedResponse.dart';
import 'package:movies_app/view/home/newReleases/new_releases_widget.dart';
import 'package:movies_app/view/home/popularMovie/popular_movie_widget.dart';
import 'package:movies_app/view/home/recomendedMovie/recomended_widget.dart';
import '../../core/model/PopularResponse.dart';
import '../../core/model/Results.dart';


class HomeTab extends StatelessWidget {
  Results? results;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        FutureBuilder<PopularResponse>(
          future:ApiManager.getPopularMovie(),
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
            var resultsList=snapshot.data?.results;
            return CarouselSlider(
              options: CarouselOptions(
                height:MediaQuery.of(context).size.height*.30,
                //aspectRatio: 16/9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 8),
                autoPlayAnimationDuration: Duration(milliseconds: 400),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,),
              items:resultsList!.map((result) {
                return PopularMovieWidget(result);
              }).toList(),
            ) ;

          },
        ),
        SizedBox(height:10,),
        FutureBuilder<PopularResponse>(
          future:ApiManager.getPopularMovie(),
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
            //var resultsList=snapshot.data?.;
            return NewReleasesWidget(popularResponse:snapshot.data,) ;

          },
        ),
        SizedBox(height:15,),
        FutureBuilder<RecomendedResponse>(
          future:ApiManager.getRecomendedMovie(),
          builder:(context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error loading data ${snapshot.error.toString()}'
                , style: TextStyle(color: context.isDarkMode ? Colors.white: Colors.green),),
              );
            }
            if (snapshot.data?.code == 'error') {
              return Center(
                child: Text('Server error ${snapshot.data?.message}'),
              );
            }
            //var resultsList=snapshot.data?.results;
            return RecomendedWidget(recomendedResponses:snapshot.data);

          },
        ),
      ],
    );
  }
}
