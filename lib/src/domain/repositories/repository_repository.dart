import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import '../entities/repository.dart';

abstract class RepositoryRepository {
  Future<Either<Failure, List<Repository>>> getRepositoryList(
      {String? repositoryName});
  Future<Either<Failure, Repository>> getRepository(String repositoryName);
}
