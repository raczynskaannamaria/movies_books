import 'package:dartz/dartz.dart';
import 'package:movies_books/core/error/failure.dart';
import 'package:movies_books/data/repository/base_repository.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';

class GetUpcomingUseCase {
  BaseRepository baseRepository;

  GetUpcomingUseCase(this.baseRepository);

  Future<Either<Failure, List<MovieEntity>>> execute() async {
    return await baseRepository.getUpcoming();
  }
}
