import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/domain/repositories/repository_repo.dart';

class GetRepositoriesUseCase {
  final RepositoryRepo repository;
  GetRepositoriesUseCase(this.repository);
  Future<Either<Failure, List<Repository>>> execute({String? search}) async {
    return await repository.getRepositories(search: search);
  }
}