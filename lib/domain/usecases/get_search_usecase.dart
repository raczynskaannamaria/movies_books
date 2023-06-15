import 'package:dartz/dartz.dart';
import 'package:movies_books/core/error/failure.dart';
import 'package:movies_books/data/repository/base_repository.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';
import 'package:movies_books/domain/entities/search_params.dart';

class GetSearchUseCase {
  BaseRepository baseRepository;

  GetSearchUseCase(this.baseRepository);

  Future<Either<Failure, List<MovieEntity>>> execute(MovieSearchParams searchParams) async {
    return await baseRepository.getSearch(searchParams.searchTerm);
  }
}
