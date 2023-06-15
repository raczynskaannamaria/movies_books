part of 'search_bloc.dart';



abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoaded extends SearchState {
  final List<MovieEntity> movies;

  SearchLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {
  final Failure errormMessage;

  SearchError(this.errormMessage);

  @override
  List<Object> get props => [errormMessage];
}

/*class SearchState extends Equatable {
  final List<MovieEntity>? movies;
  final RequestState state;
  const SearchState({this.movies, required this.state});

  SearchState copyWith({
    List<MovieEntity>? movies,
    required RequestState state,
  }) {
    return SearchState(movies: movies, state: state);
  }

  @override
  List<Object?> get props => [movies];
}*/
