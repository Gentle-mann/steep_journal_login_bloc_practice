import 'package:flutter/foundation.dart';
import 'package:steep_journal_login_bloc_practice/models/login_token.dart';

@immutable
abstract class AuthServiceProtocol {
  Future<LoginToken?>? login({required String email, required String password});
  Future<void>? register(
      {required String email,
      required String password,
      required String username});
}

@immutable
class LoginService implements AuthServiceProtocol {
  @override
  Future<LoginToken?>? login(
      {required String email, required String password}) {
    return Future.delayed(const Duration(seconds: 2),
            () => email == 'a@b.com' && password == '123456')
        .then((value) => value ? const LoginToken.success() : null);
  }

  @override
  Future<void>? register(
      {required String email,
      required String password,
      required String username}) {
    return Future.delayed(const Duration(seconds: 2), () {});
  }
}
