import 'package:flutter_struct/contracts/user.repository.dart';
import 'package:flutter_struct/data_source/models/user.model.dart';
import 'package:flutter_struct/main.dart';

class UserRepositoryLocal implements UserRepository {
  UserRepositoryLocal({
    required LocalClient localClient,
  });

  @override
  Future<UserModel> find() async => UserModel.fromJson({});
}
