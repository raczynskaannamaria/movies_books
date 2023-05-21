import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';
import 'package:movies_books/domain/usecases/get_trending_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  GetTrendingUseCase getTrendingUseCase;

  MovieBloc({required this.getTrendingUseCase}) : super(MovieInitial()) {
    on<GetTrendingEvent>((event, emit) async {
      emit(MovieLoading());
      try {
        final result = await getTrendingUseCase.execute();
        result.fold(
          (failure) => emit(MovieError(message: failure.errorMessage)),
          (movies) => emit(
            MovieLoaded(moviesList: movies),
          ),
        );
      } catch (e) {
        emit(
          MovieError(
            message: e.toString(),
          ),
        );
      }
    });
  }
}
