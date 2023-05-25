part of 'details_bloc.dart';

class DetailsState extends Equatable {
  final DetailsEntity? detailsEntity;
  final RequestState state;
  const DetailsState({this.detailsEntity, required this.state});

  DetailsState copyWith({
    DetailsEntity? detailsEntity,
    required RequestState state,
  }) {
    return DetailsState(
        detailsEntity: detailsEntity ?? this.detailsEntity, state: state);
  }

  @override
  List<Object?> get props => [detailsEntity];
}
