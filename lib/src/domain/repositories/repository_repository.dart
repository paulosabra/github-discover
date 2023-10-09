import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/Repository.dart';

abstract class RepositoryRepository {
  Future<Either<Failure, Repository>> getRepository();
  Future<Repositories> getRepositoriesList();
}
