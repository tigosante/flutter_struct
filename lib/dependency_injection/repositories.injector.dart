import 'package:flutter_struct/contracts/dependency.injection.injector.dart';
import 'package:flutter_struct/contracts/user.repository.dart';
import 'package:flutter_struct/data_source/repositories/user.repository.local.dart';
import 'package:flutter_struct/data_source/repositories/user.repository.remote.dart';
import 'package:flutter_struct/main.dart';

class RepositoriesInjector implements DependencyInjectionInjector {
  RepositoriesInjector({
    required GetIt getIt,
  }) : _getIt = getIt;

  final GetIt _getIt;

  @override
  T get<T extends Object>({String? instanceName}) =>
      _getIt.get<T>(instanceName: instanceName);

  @override
  Future<void> register() async {}

  @override
  Future<void> registerWithDependecy({
    required T Function<T extends Object>({String? instanceName}) dependency,
  }) async {
    _getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryRemote(restClient: dependency()),
      instanceName: UserRepositoryEnum.remote.asString(),
    );
    _getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryLocal(localClient: dependency()),
      instanceName: UserRepositoryEnum.local.asString(),
    );
  }
}
