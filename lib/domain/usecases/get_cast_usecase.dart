import 'package:dartz/dartz.dart';
import 'package:movies_books/core/error/failure.dart';
import 'package:movies_books/data/repository/base_repository.dart';
import 'package:movies_books/domain/entities/cast_entity.dart';

class GetCastUseCase {
  BaseRepository baseRepository;

  GetCastUseCase(this.baseRepository);

  Future<Either<Failure, List<CastEntity>>> execute(int id) async {
    return await baseRepository.getCast(id);
  }
}
