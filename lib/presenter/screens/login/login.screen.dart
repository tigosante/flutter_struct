import 'package:flutter_struct/dependency_injection/injector.dart';
import 'package:flutter_struct/presenter/screens/login/login.controller.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _controller = LoginController(
    userUseCase: Injector.useCase(),
    analytics: Injector.analytics(),
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
