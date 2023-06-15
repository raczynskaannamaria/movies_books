import 'package:dartz/dartz.dart';
import 'package:movies_books/core/error/failure.dart';
import 'package:movies_books/domain/entities/cast_entity.dart';
import 'package:movies_books/domain/entities/details_entity.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';

abstract class BaseRepository {
  Future<Either<Failure, List<MovieEntity>>> getSearch(String searchTerm);

  Future<Either<Failure, List<MovieEntity>>> getTrending();

  Future<Either<Failure, List<MovieEntity>>> getLatest();

  Future<Either<Failure, List<MovieEntity>>> getTopRated();

  Future<Either<Failure, List<MovieEntity>>> getUpcoming();

  Future<Either<Failure, DetailsEntity>> getDetails(int movieId);

  Future<Either<Failure, List<CastEntity>>> getCast(int movieId);
}
