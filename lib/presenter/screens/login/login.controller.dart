import 'package:flutter_struct/analytics/screens/login/login.analytics.imports.dart';
import 'package:flutter_struct/contracts/user.use.case.dart';

class LoginController {
  LoginController({
    required UserUseCase userUseCase,
    required LoginAnalytics analytics,
  });
}
