import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/datasources/local/profile_local_data_source.dart';
import 'package:github_discover/src/data/datasources/remote/profile_remote_data_source.dart';
import 'package:github_discover/src/data/models/skill_model.dart';
import 'package:github_discover/src/data/utils/exception.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/profile.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/domain/entities/skill.dart';
import 'package:github_discover/src/domain/repositories/profile_repository.dart';
import 'package:github_discover/src/domain/repositories/repository_repository.dart';

class RepositoryRepositoryImpl implements RepositoryRepository {
  

  // @override
  // Future<Either<Failure, Profile>> getProfile() async {
  //   try {
  //     final result = await remoteDataSource.getProfile();
  //     return Right(result.toEntity());
  //   } on ServerException {
  //     return const Left(ServerFailure('Server Exception'));
  //   } on SocketException {
  //     return const Left(ConnectionFailure('Falha na conexão com a rede'));
  //   }
  // }

  // @override
  // Future<Skills> getSkillList() async {
  //   final result = await localDataSource.getSkillList();
  //   return result.map((item) => item.toEntity()).toList();
  // }

  // @override
  // Future<void> addSkill(Skill skill) {
  //   return localDataSource.saveSkill(SkillModel.fromEntity(skill));
  // }

  // @override
  // Future<void> deleteSkill(int id) {
  //   return localDataSource.deleteSkill(id);
  // }

  // @override
  // Future<void> updateSkill(Skill skill) {
  //   return localDataSource.updateSkill(
  //     skill.id!,
  //     SkillModel.fromEntity(skill),
  //   );
  // }

  @override
  Future<Repositories> getRepositoriesList() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Repository>> getRepository() {
    throw UnimplementedError();
  }
}
