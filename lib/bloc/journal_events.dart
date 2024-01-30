import 'package:flutter/foundation.dart';

@immutable
abstract class JournalEvents {}

@immutable
class RegisterEvent implements JournalEvents {
  const RegisterEvent();
}

@immutable
class LoginEvent implements JournalEvents {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });
}

@immutable
class GetJournalEvent implements JournalEvents {
  const GetJournalEvent();
}
