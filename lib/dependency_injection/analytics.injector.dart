import 'package:flutter_struct/analytics/analytics.imports.dart';
import 'package:flutter_struct/contracts/dependency_injection/dependency.injection.injector.dart';
import 'package:flutter_struct/main.dart';

class AnalyticsInjector implements DependencyInjectionInjector {
  AnalyticsInjector({
    required GetIt getIt,
  }) : _getIt = getIt;

  final GetIt _getIt;

  @override
  T get<T extends Object>({String? instanceName}) => _getIt.get<T>();

  @override
  Future<void> register() async {}

  @override
  Future<void> registerWithDependecy(
      {required T Function<T extends Object>({
        String? instanceName,
      })
          dependency}) async {
    _getIt.registerLazySingleton<LoginAnalytics>(
      () => LoginAnalyticsMain(
        loginAnalyticsFirebase: LoginAnalyticsFirebase(firebase: dependency()),
        loginAnalyticsFacebook: LoginAnalyticsFacebook(facebook: dependency()),
      ),
    );
  }
}
