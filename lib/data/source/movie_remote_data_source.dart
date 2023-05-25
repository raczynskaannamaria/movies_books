import 'package:dio/dio.dart';
import 'package:movies_books/core/error/failure.dart';
import 'package:movies_books/core/util/api_constants.dart';
import 'package:movies_books/data/models/details_model.dart';
import 'package:movies_books/data/models/movie_model.dart';

abstract class DataSourceRepository {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getLatest();
  Future<List<MovieModel>> getTopRated();
  Future<List<MovieModel>> getUpcoming();
  Future<DetailsModel> getDetails(int movieId);
}

class MovieRemoteDataSource extends DataSourceRepository {
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
    final response = await Dio().get(ApiConstants.detail_URL(movieId));

    try {
      if (response.statusCode == 200) {
        final data = response.data;
        return DetailsModel.fromJson(data);
      } else {
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }
}
