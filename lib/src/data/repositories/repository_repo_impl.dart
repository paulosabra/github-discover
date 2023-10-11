import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/datasources/remote/repository_remote_data_source.dart';
import 'package:github_discover/src/data/utils/exception.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/domain/repositories/repository_repo.dart';

class RepositoryRepoImpl implements RepositoryRepo {
  final RepositoryRemoteDataSource remoteDataSource;

  RepositoryRepoImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Repository>>> getRepositories(
      {String? search}) async {
    try {
      final result = await remoteDataSource.getRepositories(search: search);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Server Exception'));
    } on SocketException {
      return const Left(ConnectionFailure('Falha na conexão com a rede'));
    }
  }

  @override
  Future<Either<Failure, Repository>> getRepository(String fullname) async {
    try {
      final result = await remoteDataSource.getRepository(fullname);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Exception'));
    } on SocketException {
      return const Left(ConnectionFailure('Falha na conexão com a rede'));
    }
  }
}