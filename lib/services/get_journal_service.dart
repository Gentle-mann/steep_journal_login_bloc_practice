import 'package:flutter/foundation.dart';
import 'package:steep_journal_login_bloc_practice/models/login_token.dart';

import '../models/journal_model.dart';

@immutable
abstract class GetJournalServiceProtocol {
  Future<List<Journal>?> getJournals({required LoginToken token});
}

@immutable
class GetJournalService implements GetJournalServiceProtocol {
  @override
  Future<List<Journal>?> getJournals({required LoginToken token}) {
    return Future.delayed(const Duration(seconds: 2), () {
      return token == const LoginToken.success() ? Journal.journals : null;
    });
  }
}
