// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import '../models/journal_model.dart';
import '../models/login_token.dart';

enum LoginError { noUser, invalidCredentials }

@immutable
class JournalState {
  final bool isHome;
  final bool isLoading;
  final LoginError? loginError;
  final List<Journal>? journalEntries;
  final LoginToken? loginToken;

  const JournalState({
    required this.isHome,
    required this.isLoading,
    required this.loginError,
    required this.journalEntries,
    required this.loginToken,
  });

  const JournalState.empty()
      : isHome = false,
        isLoading = false,
        loginError = null,
        journalEntries = null,
        loginToken = null;

  @override
  String toString() {
    return 'JournalState(isHome: $isHome, isLoading: $isLoading, loginError: $loginError, journalEntries: $journalEntries, loginToken: $loginToken)';
  }
}
