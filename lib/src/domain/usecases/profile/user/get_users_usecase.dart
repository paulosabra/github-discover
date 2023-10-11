import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:github_discover/src/domain/repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository user;

  GetUsersUseCase(this.user);

  Future<Either<Failure, List<User>>> execute({String? search}) async {
    return await user.getUsers(search: search);
  }
}