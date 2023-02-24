import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/model/BrowseCategory/BrowseCategoryResponse.dart';
import 'package:movies_app/core/model/RecomendedResponse.dart';
import '../model/MovieDiscover/MovieDiscoverResponse.dart';
import '../model/MovieInformationResponse.dart';
import '../model/PopularResponse.dart';
import '../model/search/SearchResponse.dart';


class ApiManager{
  static const String baseUrl = 'api.themoviedb.org';
  static const String apiKey = '3a4209a91764d7c81a467dd484fb76d7';

  static Future<PopularResponse> getPopularMovie() async {
    var url = Uri.https(baseUrl, '/3/movie/popular',
        {'api_key': apiKey, });
    var response = await http.get(url);
    return PopularResponse.fromJson(jsonDecode(response.body));
  }
  static Future<RecomendedResponse> getRecomendedMovie() async {
    var url = Uri.https(baseUrl, '/3/movie/top_rated',
        {'api_key': apiKey, });
    var response = await http.get(url);
    return RecomendedResponse.fromJson(jsonDecode(response.body));
  }
  static Future<MovieInformationResponse> getMovieInformation({int? movieId,}) async {
    var url = Uri.https(baseUrl, '/3/movie/$movieId',
        {'api_key': apiKey,});
    var response = await http.get(url);
    return MovieInformationResponse.fromJson(jsonDecode(response.body));
  }
  static Future<SearchResponse> getMovieSearch(String query) async {
    var url = Uri.https(baseUrl, '/3/search/movie',
        {'api_key': apiKey,'query':query});
    var response = await http.get(url);
    return SearchResponse.fromJson(jsonDecode(response.body));
  }
  static Future<BrowseCategoryResponse> getBrowseCategory() async {
    var url = Uri.https(baseUrl, '/3/genre/movie/list',
        {'api_key': apiKey, });
    var response = await http.get(url);
    return BrowseCategoryResponse.fromJson(jsonDecode(response.body));
  }
  static Future<MovieDiscoverResponse> getMovieDiscover({String? genreName}) async {
    var url = Uri.https(baseUrl, '/3/discover/movie',
        {'api_key': apiKey,'with_genres': genreName, });
    var response = await http.get(url);
    return MovieDiscoverResponse.fromJson(jsonDecode(response.body));
  }
}

//https://api.themoviedb.org
// /3/movie/popular?api_key=3a4209a91764d7c81a467dd484fb76d7
//-----------------------------------------------------------
//https://api.themoviedb.org
// /3/movie/top_rated?api_key=3a4209a91764d7c81a467dd484fb76d7
//-----------------------------------------------------------
//https://api.themoviedb.org
// /3/movie/550?api_key=3a4209a91764d7c81a467dd484fb76d7
//--------------------------------------
//https://api.themoviedb.org
// /3/search/movie?api_key=3a4209a91764d7c81a467dd484fb76d7
// &query=fight club