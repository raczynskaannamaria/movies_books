import 'package:dartz/dartz.dart';
import 'package:movies_books/core/error/failure.dart';
import 'package:movies_books/data/repository/base_repository.dart';

import '../entities/movie_entity.dart';

class GetLatestUseCase {
   BaseRepository baseRepository;

  GetLatestUseCase(this.baseRepository);

  Future<Either<Failure, List<MovieEntity>>> execute() async {
    return await baseRepository.getLatest();
  }
}
