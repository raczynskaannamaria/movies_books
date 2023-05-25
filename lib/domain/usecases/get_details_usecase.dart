import 'package:dartz/dartz.dart';
import 'package:movies_books/core/error/failure.dart';
import 'package:movies_books/data/repository/base_repository.dart';
import 'package:movies_books/domain/entities/details_entity.dart';

class GetDetailsUseCase {
  BaseRepository baseRepository;

  GetDetailsUseCase(this.baseRepository);

  Future<Either<Failure, DetailsEntity>> execute(int movieId) {
    return baseRepository.getDetails(movieId);
  }
}