import 'package:dio/dio.dart';
import 'package:movies_books/core/error/failure.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/util/api_client.dart';
import 'package:movies_books/core/util/api_constants.dart';
import 'package:movies_books/data/models/cast_model.dart';
import 'package:movies_books/data/models/details_model.dart';
import 'package:movies_books/data/models/movie_model.dart';
import 'package:movies_books/domain/entities/cast_entity.dart';

abstract class DataSourceRepository {
  Future<List<MovieModel>> getSearch(String searchTerm);
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getLatest();
  Future<List<MovieModel>> getTopRated();
  Future<List<MovieModel>> getUpcoming();
  Future<DetailsModel> getDetails(int movieId);
  Future<List<CastModel>> getCast(int movieId);
}

class MovieRemoteDataSource extends DataSourceRepository {
  final ApiClient _client;

  MovieRemoteDataSource(this._client);
  @override
  Future<List<MovieModel>> getSearch(String searchTerm) async {
    try {
      final response = await Dio().get(ApiConstants.search_URL(searchTerm));
      if (response.statusCode == 200) {
        final results = response.data['results'] as List;

        if (results != null) {
          final List<MovieModel> movies = List<MovieModel>.from(
            results.map((json) => MovieModel.fromJson(json)),
          );
          return movies;
        } else {
          print(
              "MovieRemoteDataSource file: Search method: Results data is null");
          return []; // Return an empty list when results data is null
        }
      } else {
        print("MovieRemoteDataSource file : Search method :: Else");
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<List<MovieModel>> getTrending() async {
    try {
      final response = await Dio().get(ApiConstants.trending_URL);
      if (response.statusCode == 200) {
        final results = response.data['results'];
        if (results != null) {
          final List<MovieModel> movies = List<MovieModel>.from(
            results.map((json) => MovieModel.fromJson(json)),
          );
          return movies;
        } else {
          print(
              "MovieRemoteDataSource file: getTopRated method: Results data is null");
          return []; // Return an empty list when results data is null
        }
        // final List<MovieModel> movies = List<MovieModel>.from(
        //   response.data['results'].map((json) => MovieModel.fromJson(json)));
        //return movies;
      } else {
        print("MovieRemoteDataSource file : getTrending method :: Else");
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<List<MovieModel>> getLatest() async {
    try {
      final response = await Dio().get(ApiConstants.latest_URL);
      if (response.statusCode == 200) {
        final results = response.data['results'];
        if (results != null) {
          final List<MovieModel> movies = List<MovieModel>.from(
            results.map((json) => MovieModel.fromJson(json)),
          );
          return movies;
        } else {
          print(
              "MovieRemoteDataSource file: getTopRated method: Results data is null");
          return [];
        }

        //final List<MovieModel> movies = List<MovieModel>.from(
        //  response.data['results'].map((json) => MovieModel.fromJson(json)));
        //return movies;
      } else {
        print("MovieRemoteDataSource file : getLatest method :: Else");
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    try {
      final response = await Dio().get(ApiConstants.toprated_URL);
      if (response.statusCode == 200) {
        final results = response.data['results'];
        if (results != null) {
          final List<MovieModel> movies = List<MovieModel>.from(
            results.map((json) => MovieModel.fromJson(json)),
          );
          return movies;
        } else {
          print(
              "MovieRemoteDataSource file: getTopRated method: Results data is null");
          return [];
        }
        //final List<MovieModel> movies = List<MovieModel>.from(
        //  response.data['results'].map((json) => MovieModel.fromJson(json)));
        //return movies;
      } else {
        print("MovieRemoteDataSource file : getTopRated method :: Else");
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<List<MovieModel>> getUpcoming() async {
    try {
      final response = await Dio().get(ApiConstants.upcoming_URL);
      if (response.statusCode == 200) {
        final results = response.data['results'];
        if (results != null) {
          final List<MovieModel> movies = List<MovieModel>.from(
            results.map((json) => MovieModel.fromJson(json)),
          );
          return movies;
        } else {
          print(
              "MovieRemoteDataSource file: getTopRated method: Results data is null");
          return [];
        }
        //  final List<MovieModel> movies = List<MovieModel>.from(
        //    response.data['results'].map((json) => MovieModel.fromJson(json)));
        //return movies;
      } else {
        print("MovieRemoteDataSource file : getUpcoming method :: Else");
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<DetailsModel> getDetails(int movieId) async {
    final detailResponse = await Dio().get(ApiConstants.detail_URL(movieId));
    final castResponse = await Dio().get(ApiConstants.cast_URL(movieId));

    try {
      if (detailResponse.statusCode ==
          200 /*&& castResponse.statusCode == 200*/) {
        final detailData = detailResponse.data;
        /*final castData = castResponse.data;*/
        return DetailsModel.fromJson(
          detailData, /*castData*/
        );
      } else {
        throw ServerFailure(
            'Failed to fetch movies: ${detailResponse.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<List<CastModel>> getCast(int movieId) async {
    final response = await Dio().get(ApiConstants.cast_URL(movieId));
    try {
      if (response.statusCode == 200) {
        final results = response.data['results'];
        if (results != null) {
          final List<CastModel> cast = List<CastModel>.from(
            results.map((json) => CastModel.fromJson(json)),
          );
          return cast;
        } else {
          print(
              "MovieRemoteDataSource file: getCast method: Results data is null");
          return [];
        }
      } else {
        print("MovieRemoteDataSource file : getCast method :: Else");
        throw ServerFailure('Failed to fetch cast: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }
}
