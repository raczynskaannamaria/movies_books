import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movies_books/core/util/api_client.dart';
import 'package:movies_books/data/repository/base_repository.dart';
import 'package:movies_books/data/repository/base_repository_impl.dart';
import 'package:movies_books/data/source/movie_remote_data_source.dart';
import 'package:movies_books/domain/usecases/get_cast_usecase.dart';
import 'package:movies_books/domain/usecases/get_details_usecase.dart';
import 'package:movies_books/domain/usecases/get_latest_usecase.dart';
import 'package:movies_books/domain/usecases/get_search_usecase.dart';
import 'package:movies_books/domain/usecases/get_toprated_usecase.dart';
import 'package:movies_books/domain/usecases/get_trending_usecase.dart';
import 'package:movies_books/domain/usecases/get_upcoming_usecase.dart';
import 'package:movies_books/presentation/movie/bloc/cast/cast_bloc.dart';
import 'package:movies_books/presentation/movie/bloc/details_bloc.dart';
import 'package:movies_books/presentation/movie/bloc/movie_bloc.dart';
import 'package:movies_books/presentation/movie/bloc/search/search_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerLazySingleton<Client>(() => Client());
    getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<Client>()));

    getIt.registerLazySingleton<DataSourceRepository>(
        () => MovieRemoteDataSource(getIt()));

    getIt.registerLazySingleton<BaseRepository>(
        () => BaseRepositoryImpl(getIt()));

    getIt.registerLazySingleton(() => GetTrendingUseCase(getIt()));
    getIt.registerLazySingleton(() => GetLatestUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedUseCase(getIt()));
    getIt.registerLazySingleton(() => GetUpcomingUseCase(getIt()));
    getIt.registerLazySingleton(() => GetDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetCastUseCase(getIt()));
    getIt.registerLazySingleton(() => GetSearchUseCase(getIt()));

    getIt.registerFactory<MovieBloc>(() => MovieBloc(
        getTrendingUseCase: getIt(),
        getLatestUseCase: getIt(),
        getTopRatedUseCase: getIt(),
        getUpcomingUseCase: getIt()));

    getIt.registerFactory<DetailsBloc>(
        () => DetailsBloc(getDetailsUseCase: getIt(), getCastUseCase: getIt()));

    getIt.registerFactory<CastBloc>(() => CastBloc(getCastUseCase: getIt()));

    getIt.registerFactory<SearchBloc>(
        () => SearchBloc(getSearchUseCase: getIt()));
  }
}
