import 'package:equatable/equatable.dart';
import 'package:movies_books/domain/entities/genre_entity.dart';

class DetailsEntity extends Equatable {
  final String? backdropPath;
  final List<GenreEntity>? genres;
  final int id;
  final String? originalLanguage;
  final String? overview;
  final double popularity;
  final String? posterPath;

  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final String title;
  final bool video;
  final double voteAverage;

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        originalLanguage,
        overview,
        popularity,
        posterPath,
        releaseDate,
        revenue,
        runtime,
        title,
        video,
        voteAverage,
      ];

  const DetailsEntity({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalLanguage,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.title,
    required this.video,
    required this.voteAverage,
  });
}
