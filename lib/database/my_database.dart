import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/database/movie.dart';


class MyDatabase{

  static CollectionReference<Movie> getMoviesCollection() {
    var tasksCollection = FirebaseFirestore.instance
        .collection('movies')
        .withConverter<Movie>(
        fromFirestore: (snapshot, options) =>
            Movie.fromFireStore(snapshot.data()!),
        toFirestore: (task, options) => task.toFireStore());
    return tasksCollection;
  }

  static Future<void> insertMovie(Movie movie) {
    var tasksCollection = getMoviesCollection();
    var doc = tasksCollection.doc();
    movie.id = doc.id;
    movie.date = (movie.date);
    return doc.set(movie);
  }

  static Stream<QuerySnapshot<Movie>> getMovieRealTimeUpdates() {
    return MyDatabase.getMoviesCollection().snapshots();
  }

}