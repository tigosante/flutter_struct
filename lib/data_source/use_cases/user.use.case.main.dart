import 'package:flutter_struct/contracts/user.repository.dart';
import 'package:flutter_struct/contracts/user.use.case.dart';

class UserUseCaseMain implements UserUseCase {
  UserUseCaseMain({
    required UserRepository userRepositoryRemote,
    required UserRepository userRepositoryLocal,
  });
}
