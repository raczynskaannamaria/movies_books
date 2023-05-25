import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_books/core/util/enums.dart';
import 'package:movies_books/domain/entities/details_entity.dart';
import 'package:movies_books/domain/usecases/get_details_usecase.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  GetDetailsUseCase getDetailsUseCase;

  DetailsBloc({required this.getDetailsUseCase})
      : super(const DetailsState(state: RequestState.loading)) {
    on<GetDetailsEvent>(((event, emit) async {
      final result = await getDetailsUseCase.execute(event.movieId);
      result.fold(
          (failure) => emit(state.copyWith(state: RequestState.error)),
          (details) => emit(state.copyWith(
              state: RequestState.loaded, detailsEntity: details)));
    }));
  }
}
