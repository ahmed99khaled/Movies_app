class Movie {
  String id;
  String title;
  String language;
  String path;
  String date;
  bool isDone;

  Movie(
      {this.id = '',
      required this.title,
      required this.language,
        required this.path,
      required this.date,
      this.isDone = false});

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'language': language,
      'path': path,
      'date': date,
      'isDone': isDone
    };
  }

  Movie.fromFireStore(Map<String, dynamic> data)
      : this(
            id: data['id'],
            title: data['title'],
            language: data['language'],
            path: data['path'],
            date:data['date'],
            isDone: data['isDone']);
}
