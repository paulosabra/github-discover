import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/repositories/user_repository.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/user.dart';

class GetUserUseCase {
  final UserRepository user;

  GetUserUseCase(this.user);

  Future<Either<Failure, User>> execute(String fullname,
      {String? search}) async {
    return await user.getUser(fullname);
  }
}
