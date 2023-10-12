import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

abstract class RepositoryRepository {
  Future<Either<Failure, Repository>> getRepository(String name);
  Future<Either<Failure, Repositories>> getRepositoriesList(String search);
}
