import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_books/core/util/enums.dart';
import 'package:movies_books/domain/entities/cast_entity.dart';
import 'package:movies_books/domain/usecases/get_cast_usecase.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  GetCastUseCase getCastUseCase;

  CastBloc({required this.getCastUseCase})
      : super(const CastState(state: RequestState.loading)) {
    on<GetCastEvent>(((event, emit) async {
      final result = await getCastUseCase.execute(event.movieId);
      result.fold(
          (failure) => emit(state.copyWith(state: RequestState.error)),
          (cast) => emit(
              state.copyWith(state: RequestState.loaded, castEntity: cast)));
    }));
  }
}
