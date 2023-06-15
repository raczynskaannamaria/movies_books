import 'package:dartz/dartz.dart';
import 'package:movies_books/core/error/failure.dart';
import 'package:movies_books/data/models/cast_model.dart';
import 'package:movies_books/data/models/movie_model.dart';
import 'package:movies_books/data/repository/base_repository.dart';
import 'package:movies_books/data/source/movie_remote_data_source.dart';
import 'package:movies_books/domain/entities/cast_entity.dart';
import 'package:movies_books/domain/entities/details_entity.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';

class BaseRepositoryImpl extends BaseRepository {
  DataSourceRepository dataSourceRepository;

  BaseRepositoryImpl(this.dataSourceRepository);

  @override
  Future<Either<Failure, List<MovieModel>>> getSearch(String searchTerm) async {
    final result = await dataSourceRepository.getSearch(searchTerm);
    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTrending() async {
    final result = await dataSourceRepository.getTrending();
    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getLatest() async {
    final result = await dataSourceRepository.getLatest();
    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRated() async {
    final result = await dataSourceRepository.getTopRated();
    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getUpcoming() async {
    final result = await dataSourceRepository.getUpcoming();
    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, DetailsEntity>> getDetails(int movieId) async {
    final result = await dataSourceRepository.getDetails(movieId);
    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<CastEntity>>> getCast(int movieId) async {
    final result = await dataSourceRepository.getCast(movieId);
    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }
}
