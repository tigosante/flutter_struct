import 'package:flutter_struct/contracts/dependency_injection/dependency.injection.injector.dart';

class Injector {
  Injector._({
    required DependencyInjectionInjector dependencies,
    required DependencyInjectionInjector repositories,
    required DependencyInjectionInjector useCases,
    required DependencyInjectionInjector analytics,
  })  : _dependencies = dependencies,
        _repositories = repositories,
        _useCases = useCases,
        _analytics = analytics;

  final DependencyInjectionInjector _dependencies;
  final DependencyInjectionInjector _repositories;
  final DependencyInjectionInjector _useCases;
  final DependencyInjectionInjector _analytics;

  static late final Injector? _instance;

  static Future<void> init({
    required DependencyInjectionInjector dependencies,
    required DependencyInjectionInjector repositories,
    required DependencyInjectionInjector useCases,
    required DependencyInjectionInjector analytics,
  }) async {
    if (_instance == null) {
      await dependencies.register();
      await repositories.registerWithDependecy(dependency: dependencies.get);
      await useCases.registerWithDependecy(dependency: repositories.get);
      await analytics.registerWithDependecy(dependency: dependencies.get);

      _instance = Injector._(
        dependencies: dependencies,
        repositories: repositories,
        useCases: useCases,
        analytics: analytics,
      );
    }
  }

  static Injector get instance => _instance!;

  T dependency<T extends Object>({String? instanceName}) =>
      _dependencies.get<T>(instanceName: instanceName);

  T repository<T extends Object>({String? instanceName}) =>
      _repositories.get<T>(instanceName: instanceName);

  T useCase<T extends Object>({String? instanceName}) =>
      _useCases.get<T>(instanceName: instanceName);

  T analytics<T extends Object>({String? instanceName}) =>
      _analytics.get<T>(instanceName: instanceName);
}
