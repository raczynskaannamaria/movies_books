import 'package:get_it/get_it.dart';
import 'package:movies_books/data/repository/base_repository.dart';
import 'package:movies_books/data/repository/base_repository_impl.dart';
import 'package:movies_books/data/source/movie_remote_data_source.dart';
import 'package:movies_books/domain/usecases/get_latest_usecase.dart';
import 'package:movies_books/domain/usecases/get_toprated_usecase.dart';
import 'package:movies_books/domain/usecases/get_trending_usecase.dart';
import 'package:movies_books/domain/usecases/get_upcoming_usecase.dart';
import 'package:movies_books/presentation/movie/bloc/movie_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerLazySingleton<DataSourceRepository>(
        () => MovieRemoteDataSource());

    getIt.registerLazySingleton<BaseRepository>(
        () => BaseRepositoryImpl(getIt()));

    getIt.registerLazySingleton(() => GetTrendingUseCase(getIt()));
    getIt.registerLazySingleton(() => GetLatestUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedUseCase(getIt()));
    getIt.registerLazySingleton(() => GetUpcomingUseCase(getIt()));

    getIt.registerFactory<MovieBloc>(() => MovieBloc(
        getTrendingUseCase: getIt(),
        getLatestUseCase: getIt(),
        getTopRatedUseCase: getIt(),
        getUpcomingUseCase: getIt()));
  }
}
