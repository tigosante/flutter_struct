import 'package:flutter_struct/contracts/repositories/user.repository.dart';
import 'package:flutter_struct/contracts/use_cases/user.use.case.dart';

class UserUseCaseMain implements UserUseCase {
  UserUseCaseMain({
    required UserRepository userRepositoryRemote,
    required UserRepository userRepositoryLocal,
  });
}
