import 'package:flutter_struct/contracts/repositories/user.repository.dart';
import 'package:flutter_struct/data_source/models/user.model.dart';
import 'package:flutter_struct/main.dart';

class UserRepositoryRemote implements UserRepository {
  UserRepositoryRemote({
    required RestClient restClient,
  });

  @override
  Future<UserModel> find() async => UserModel.fromJson({});
}
