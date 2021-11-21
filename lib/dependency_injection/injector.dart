import 'package:flutter_struct/contracts/dependency.injection.injector.dart';

abstract class Injector {
  Injector._();

  static late final DependencyInjectionInjector? _dependencies;
  static late final DependencyInjectionInjector? _repositories;
  static late final DependencyInjectionInjector? _useCases;
  static late final DependencyInjectionInjector? _analytics;

  static Future<void> init({
    required DependencyInjectionInjector dependencies,
    required DependencyInjectionInjector repositories,
    required DependencyInjectionInjector useCases,
    required DependencyInjectionInjector analytics,
  }) async {
    if (_dependencies == null) await dependencies.register();
    if (_repositories == null) await repositories.registerWithDependecy(dependency: dependencies.get);
    if (_useCases == null) await useCases.registerWithDependecy(dependency: repositories.get);
    if (_analytics == null) await analytics.registerWithDependecy(dependency: dependencies.get);
  }

  static T dependency<T extends Object>({String? instanceName}) => _dependencies!.get<T>(instanceName: instanceName);
  static T repository<T extends Object>({String? instanceName}) => _repositories!.get<T>(instanceName: instanceName);
  static T useCase<T extends Object>({String? instanceName}) => _useCases!.get<T>(instanceName: instanceName);
  static T analytics<T extends Object>({String? instanceName}) => _analytics!.get<T>(instanceName: instanceName);
}
