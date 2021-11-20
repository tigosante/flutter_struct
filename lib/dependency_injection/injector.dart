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
      await dependencies.register(dependency: _dependency);
      await repositories.register(dependency: dependencies.get);
      await useCases.register(dependency: repositories.get);
      await analytics.register(dependency: dependencies.get);

      _instance = Injector._(
        dependencies: dependencies,
        repositories: repositories,
        useCases: useCases,
        analytics: analytics,
      );
    }
  }

  static T _dependency<T extends Object>({String? instanceName}) =>
      throw UnimplementedError();

  static Injector get instance => _instance!;

  T dependency<T extends Object>() => _dependencies.get<T>();
  T repository<T extends Object>() => _repositories.get<T>();
  T useCase<T extends Object>() => _useCases.get<T>();
  T analytics<T extends Object>() => _analytics.get<T>();
}
