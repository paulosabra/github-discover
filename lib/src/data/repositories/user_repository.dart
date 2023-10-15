import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String fullname);

  Future<Either<Failure, List<User>>> getUsers({String? search});
}