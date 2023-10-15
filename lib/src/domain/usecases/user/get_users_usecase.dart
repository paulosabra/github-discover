import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/repositories/user_repository.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/user.dart';

class GetUsersUseCase {
  final UserRepository users;

  GetUsersUseCase(this.users);

  Future<Either<Failure, List<User>>> execute({String? search}) async {
    return await users.getUsers(search: search);
  }
}