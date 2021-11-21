import 'package:flutter_struct/contracts/dependency_injection/dependency.injection.injector.dart';
import 'package:flutter_struct/contracts/use_cases/user.use.case.dart';
import 'package:flutter_struct/data_source/use_case/user.use.case.main.dart';
import 'package:flutter_struct/main.dart';

class UseCasesInjector implements DependencyInjectionInjector {
  UseCasesInjector({
    required GetIt getIt,
  }) : _getIt = getIt;

  final GetIt _getIt;

  @override
  T get<T extends Object>({String? instanceName}) =>
      _getIt.get<T>(instanceName: instanceName);

  @override
  Future<void> register() async {}

  @override
  Future<void> registerWithDependecy(
      {required T Function<T extends Object>({
        String? instanceName,
      })
          dependency}) async {
    _getIt.registerLazySingleton<UserUseCase>(
      () => UserUseCaseMain(
        userRepositoryLocal: dependency(instanceName: "local"),
        userRepositoryRemote: dependency(instanceName: "remote"),
      ),
    );
  }
}
