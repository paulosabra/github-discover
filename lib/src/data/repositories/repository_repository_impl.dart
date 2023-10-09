import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/datasources/local/repository_local_data_source.dart';
import 'package:github_discover/src/data/datasources/remote/Repository_remote_data_source.dart';
import 'package:github_discover/src/data/utils/exception.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/domain/repositories/repository_repository.dart';

class RepositoryRepositoryImpl implements RepositoryRepository {
  final RepositoryLocalDataSource localDataSource;
  final RepositoryRemoteDataSource remoteDataSource;

  RepositoryRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Repository>> getRepository() async {
    try {
      final result = await remoteDataSource.getRepository();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Exception'));
    } on SocketException {
      return const Left(ConnectionFailure('Falha na conexão com a rede'));
    }
  }

  @override
  Future<Repositories> getRepositoriesList() async {
    final result = await localDataSource.getRepositoriesList();
    return result.map((item) => item.toEntity()).toList();
  }
}
