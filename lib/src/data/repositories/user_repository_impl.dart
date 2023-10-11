import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/datasources/remote/user_remote_data_source.dart';
import 'package:github_discover/src/data/utils/exception.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:github_discover/src/domain/repositories/user_repository.dart';


class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<User>>> getUsers({String? search}) async {
    try {
      final result = await remoteDataSource.getUsers(search: search);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Server Exception'));
    } on SocketException {
      return const Left(ConnectionFailure('Falha na conexão com a rede'));
    }
  }

  @override
  Future<Either<Failure, User>> getUser(String fullname) async {
    try {
      final result = await remoteDataSource.getUser(fullname);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Exception'));
    } on SocketException {
      return const Left(ConnectionFailure('Falha na conexão com a rede'));
    }
  }
}