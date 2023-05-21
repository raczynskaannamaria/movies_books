import 'package:movies_books/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required String backdropPath,
    required int id,
    required String title,
    required String overview,
    required List<int> genreIds,
    required String posterPath,
    required double popularity,
    required String releaseDate,
    required double voteAverage,
    required int voteCount,
  }) : super(
          backdropPath: backdropPath,
          id: id,
          title: title,
          overview: overview,
          genreIds: genreIds,
          posterPath: posterPath,
          popularity: popularity,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      genreIds: json['genre_ids'].cast<int>(),
      popularity: json['popularity'].toDouble() ?? 0.0,
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble() ?? 0.0,
      voteCount: json['vote_count'],
    );
  }
}
