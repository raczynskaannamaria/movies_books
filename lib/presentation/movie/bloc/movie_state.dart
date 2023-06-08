part of 'movie_bloc.dart';

class MovieState extends Equatable {

  final List<MovieEntity> trendingMovies;
  final RequestState trendingState;
  final String trendingMessage;
  final List<MovieEntity> latestMovies;
  final RequestState latestState;
  final String latestMessage;
  final List<MovieEntity> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;
  final List<MovieEntity> upcomingMovies;
  final RequestState upcomingState;
  final String upcomingMessage;

  const MovieState({
   
    this.trendingMovies = const [],
    this.trendingState = RequestState.loading,
    this.trendingMessage = '',
    this.latestMovies = const [],
    this.latestState = RequestState.loading,
    this.latestMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
    this.upcomingMovies = const [],
    this.upcomingState = RequestState.loading,
    this.upcomingMessage = '',
  });

  MovieState copyWith({
    
    List<MovieEntity>? trendingMovies,
    RequestState? trendingState,
    String? trendingMessage,
    List<MovieEntity>? latestMovies,
    RequestState? latestState,
    String? latestMessage,
    List<MovieEntity>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
    List<MovieEntity>? upcomingMovies,
    RequestState? upcomingState,
    String? upcomingMessage,
  }) {
    return MovieState(
     
      trendingMovies: trendingMovies ?? this.trendingMovies,
      trendingState: trendingState ?? this.trendingState,
      trendingMessage: trendingMessage ?? this.trendingMessage,
      latestMovies: upcomingMovies ?? this.latestMovies,
      latestState: upcomingState ?? this.latestState,
      latestMessage: upcomingMessage ?? this.latestMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      upcomingState: upcomingState ?? this.upcomingState,
      upcomingMessage: upcomingMessage ?? this.upcomingMessage,
    );
  }

  @override
  List<Object?> get props => [
      
        trendingMovies,
        trendingState,
        trendingMessage,
        latestMovies,
        latestState,
        latestMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage,
        upcomingMovies,
        upcomingState,
        upcomingMessage,
      ];
}
