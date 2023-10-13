import 'dart:io';

import 'package:github_discover/src/data/datasources/remote/repository_remote_data_source.dart';
import 'package:github_discover/src/data/utils/exception.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/domain/repositories/repository_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/utils/failure.dart';

class RepositoryRepositoryImpl implements RepositoryRepository {
  final RepositoryRemoteDataSource remoteDataSource;

  RepositoryRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Repository>>> getRepositoryList(
      {String? repositoryName}) async {
    try {
      final result = await remoteDataSource.getRepositoryList(
          repositoryName: repositoryName);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Server Exception'));
    } on SocketException {
      return const Left(ConnectionFailure('Falha na conexão com a rede'));
    }
  }

  @override
  Future<Either<Failure, Repository>> getRepository(
      String repositoryName) async {
    try {
      final result = await remoteDataSource.getRepository(repositoryName);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Exception'));
    } on SocketException {
      return const Left(ConnectionFailure('Falha na conexão com a rede'));
    }
  }
}
