import 'package:movies_books/data/models/cast_model.dart';
import 'package:movies_books/data/models/genre_model.dart';
import 'package:movies_books/domain/entities/details_entity.dart';

class DetailsModel extends DetailsEntity {
  factory DetailsModel.fromJson(
      Map<String, dynamic> json,/* Map<String, dynamic> castData*/) {
    return DetailsModel(
      backdropPath: json['backdrop_path']!,
      genres: GenreModel.from(json['genres']),
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
      /*cast: CastModel.from(castData)*/
    );
  }
  const DetailsModel({
    required String backdropPath,
    required List<GenreModel> genres,
    required int id,
    required String originalLanguage,
    required String overview,
    required double popularity,
    required String posterPath,
    required String releaseDate,
    required int revenue,
    required int runtime,
    required String title,
    required bool video,
    required double voteAverage,
   /* required List<CastModel> cast,*/
  }) : super(
          backdropPath: backdropPath,
          genres: genres,
          id: id,
          originalLanguage: originalLanguage,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          revenue: revenue,
          runtime: runtime,
          title: title,
          video: video,
          voteAverage: voteAverage,
          /*cast: cast,*/
        );
}
