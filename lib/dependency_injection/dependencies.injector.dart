import 'package:flutter_struct/contracts/dependency_injection/dependency.injection.injector.dart';
import 'package:flutter_struct/main.dart';

class DependenciesInjector implements DependencyInjectionInjector {
  DependenciesInjector({
    required GetIt getIt,
  }) : _getIt = getIt;

  final GetIt _getIt;

  @override
  T get<T extends Object>({String? instanceName}) => _getIt.get<T>();

  @override
  Future<void> register(
      {required T Function<T extends Object>({
        String? instanceName,
      })
          dependency}) async {
    _getIt.registerLazySingleton<Firebase>(() => Firebase());
    _getIt.registerLazySingleton<Facebook>(() => Facebook());
  }
}
