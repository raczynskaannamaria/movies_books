part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {}

class GetCastEvent extends CastEvent {
  final int movieId;
  GetCastEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
