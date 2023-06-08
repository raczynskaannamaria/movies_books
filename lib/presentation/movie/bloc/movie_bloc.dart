import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_books/core/util/enums.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';
import 'package:movies_books/domain/usecases/get_latest_usecase.dart';
import 'package:movies_books/domain/usecases/get_search_usecase.dart';
import 'package:movies_books/domain/usecases/get_toprated_usecase.dart';
import 'package:movies_books/domain/usecases/get_trending_usecase.dart';
import 'package:movies_books/domain/usecases/get_upcoming_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  GetTrendingUseCase getTrendingUseCase;
  GetLatestUseCase getLatestUseCase;
  GetTopRatedUseCase getTopRatedUseCase;
  GetUpcomingUseCase getUpcomingUseCase;

  MovieBloc({
    required this.getTrendingUseCase,
    required this.getLatestUseCase,
    required this.getTopRatedUseCase,
    required this.getUpcomingUseCase,
  }) : super(const MovieState()) {
    on<GetTrendingEvent>(_getTrending);
    on<GetLatestEvent>(_getLatest);
    on<GetTopRatedEvent>(_getTopRated);
    on<GetUpcomingEvent>(_getUpcoming);
  }

  Future<void> _getTrending(
      GetTrendingEvent event, Emitter<MovieState> emit) async {
    final result = await getTrendingUseCase.execute();
    result.fold(
        (l) => emit(state.copyWith(
              trendingState: RequestState.error,
              trendingMessage: l.errorMessage,
            )),
        (r) => emit(state.copyWith(
              trendingState: RequestState.loaded,
              trendingMovies: r,
            )));
  }

  Future<void> _getLatest(
      GetLatestEvent event, Emitter<MovieState> emit) async {
    final result = await getLatestUseCase.execute();
    result.fold(
        (l) => emit(state.copyWith(
              latestState: RequestState.error,
              latestMessage: l.errorMessage,
            )),
        (r) => emit(state.copyWith(
              latestState: RequestState.loaded,
              latestMovies: r,
            )));
  }

  Future<void> _getTopRated(
      GetTopRatedEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedUseCase.execute();
    result.fold(
        (l) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.errorMessage,
            )),
        (r) => emit(state.copyWith(
              topRatedState: RequestState.loaded,
              topRatedMovies: r,
            )));
  }

  Future<void> _getUpcoming(
      GetUpcomingEvent event, Emitter<MovieState> emit) async {
    final result = await getUpcomingUseCase.execute();
    result.fold(
        (l) => emit(state.copyWith(
              upcomingState: RequestState.error,
              upcomingMessage: l.errorMessage,
            )),
        (r) => emit(state.copyWith(
              upcomingState: RequestState.loaded,
              upcomingMovies: r,
            )));
  }
}
