part of 'cast_bloc.dart';

class CastState extends Equatable {
  final List<CastEntity>? castEntity;
  final RequestState state;
  const CastState({this.castEntity, required this.state});

  CastState copyWith({
    List<CastEntity>? castEntity,
    required RequestState state,
  }) {
    return CastState(castEntity: castEntity ?? this.castEntity, state: state);
  }

  @override
  List<Object?> get props => [castEntity];
}
