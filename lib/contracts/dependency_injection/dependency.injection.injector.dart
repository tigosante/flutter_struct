mixin DependencyInjectionInjector {
  T get<T extends Object>({String? instanceName});

  Future<void> register();

  Future<void> registerWithDependecy(
      {required T Function<T extends Object>({
        String? instanceName,
      })
          dependency});
}
