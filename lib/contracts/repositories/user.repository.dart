import 'package:flutter_struct/data_source/models/user.model.dart';

mixin UserRepository {
  Future<UserModel> find();
}

enum UserRepositoryEnum {
  remote,
  local,
}

extension UserRepositoryEnumExtension on UserRepositoryEnum {
  String asString() => (this).toString().split(".").last;
}
