import 'Results.dart';

class MovieDiscoverResponse {
  String? message;
  num? code;
  num? page;
  List<ResultDiscover>? results;
  num? totalPages;
  num? totalResults;
  MovieDiscoverResponse({
      this.page,
      this.code,
      this.message,
      this.results,
      this.totalPages, 
      this.totalResults,});

  MovieDiscoverResponse.fromJson(dynamic json) {
    message = json['status_message'];
    code = json['status_code'];
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(ResultDiscover.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}