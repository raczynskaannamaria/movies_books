part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {}

class GetCastEvent extends CastEvent {
  final int id;
  GetCastEvent({required this.id});

  @override
  List<Object> get props => [id];
}
