import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/domain/repositories/repository_repository.dart';

class GetRepositoryUseCase {
  final RepositoryRepository repository;

  GetRepositoryUseCase(this.repository);

  Future<Either<Failure, Repository>> execute() async {
    return await repository.getRepository();
  }
}
