import 'Results.dart';

class SearchResponse {
  int? page;
  String? message;
  int? code;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  SearchResponse({
      this.page,
      this.code,
      this.message,
      this.results, 
      this.totalPages, 
      this.totalResults,});

  SearchResponse.fromJson(dynamic json) {
    message = json['status_message'];
    code = json['status_code'];
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Result.fromJson(v));
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