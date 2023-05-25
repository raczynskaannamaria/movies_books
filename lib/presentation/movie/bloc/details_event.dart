part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {}

class GetDetailsEvent extends DetailsEvent {
  final int movieId;
  GetDetailsEvent({required this.movieId});

  @override
  List<Object> get props => [];
}
