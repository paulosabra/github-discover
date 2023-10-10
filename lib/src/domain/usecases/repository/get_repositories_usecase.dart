import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/domain/repositories/repository_repository.dart';

class GetRepositoriesUseCase {
  final RepositoryRepository repository;
  GetRepositoriesUseCase(this.repository);

  Future<Either<Failure, RepositoriesModel>> execute(
      {String? searchArg}) async {
    return await repository.getRepositoriesList(searchArg: searchArg);
  }
}
