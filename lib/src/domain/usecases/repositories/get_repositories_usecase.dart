import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/domain/repositories/repository_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../data/utils/failure.dart';
class GetRepositoriesUseCase {
  final RepositoryRepository repository;

  GetRepositoriesUseCase(this.repository);

  Future<Either<Failure, Repositories>> execute(String search) async {
    return await repository.getRepositoriesList(search);
  }
}
