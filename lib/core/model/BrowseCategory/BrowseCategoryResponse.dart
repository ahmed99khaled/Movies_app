import 'Genres.dart';

class BrowseCategoryResponse {
  String? message;
  int? code;
  List<Genre>? genres;
  BrowseCategoryResponse({
      this.genres,
      this.code,
      this.message});

  BrowseCategoryResponse.fromJson(dynamic json) {
    message = json['status_message'];
    code = json['status_code'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genre.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}