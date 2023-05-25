import 'package:movies_books/data/models/genre_model.dart';
import 'package:movies_books/domain/entities/details_entity.dart';

class DetailsModel extends DetailsEntity {
  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      backdropPath: json['backdrop_path']!,
      genres: json['genres'] != null
          ? List<GenreModel>.from(
              json['genres'].map((genre) => GenreModel.fromJson(genre)))
          : null,
      id: json['id'],
      originalLanguage: json['original_language'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
  const DetailsModel(
      {required super.backdropPath,
      required super.genres,
      required super.id,
      required super.originalLanguage,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required super.releaseDate,
      required super.revenue,
      required super.runtime,
      required super.title,
      required super.video,
      required super.voteAverage});
}
