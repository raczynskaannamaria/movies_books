import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_books/core/error/failure.dart';
import 'package:movies_books/core/util/enums.dart';
import 'package:movies_books/data/models/movie_model.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';
import 'package:movies_books/domain/entities/search_params.dart';
import 'package:movies_books/domain/usecases/get_search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchUseCase getSearchUseCase;

  SearchBloc({
    required this.getSearchUseCase,
  }) : super(SearchInitial()) {
    on<GetSearchEvent>((event, emit) async {
      if (event.searchTerm.length > 2) {
        emit(SearchLoading());
        final Either<Failure, List<MovieEntity>> response =
            await getSearchUseCase
                .execute(MovieSearchParams(searchTerm: event.searchTerm));
        response.fold(
          (l) => emit(SearchError(l)),
          (r) => emit(SearchLoaded(r)),
        );
      }
    });
  }
}
