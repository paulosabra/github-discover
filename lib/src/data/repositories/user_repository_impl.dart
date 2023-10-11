import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/datasources/remote/user_remote_data_source.dart';
import 'package:github_discover/src/data/repositories/user_repository.dart';
import 'package:github_discover/src/data/utils/exception.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<User>>> getUser(
      {String? search}) async {
    try {
      final result = await remoteDataSource.getUser(search: search);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Server Exception'));
    } on SocketException {
      return const Left(ConnectionFailure('Falha na conexão com a rede'));
    }
  }

 
}