mixin DependencyInjectionInjector {
  T get<T extends Object>({String? instanceName});

  Future<void> register(
      {required T Function<T extends Object>({
        String? instanceName,
      })
          dependency});
}
