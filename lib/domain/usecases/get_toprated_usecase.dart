import 'package:dartz/dartz.dart';
import 'package:movies_books/core/error/failure.dart';
import 'package:movies_books/data/repository/base_repository.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';

class GetTopRatedUseCase {
   BaseRepository baseRepository;

  GetTopRatedUseCase(this.baseRepository);

  Future<Either<Failure, List<MovieEntity>>> execute() async {
    return await baseRepository.getTopRated();
  }
}
