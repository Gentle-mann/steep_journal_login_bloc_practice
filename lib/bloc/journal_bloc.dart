import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steep_journal_login_bloc_practice/models/login_token.dart';

import '../services/auth_service.dart';
import '../services/get_journal_service.dart';
import 'journal_events.dart';
import 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvents, JournalState> {
  final LoginService loginServices;
  final GetJournalService getJournalService;

  JournalBloc({
    required this.loginServices,
    required this.getJournalService,
  }) : super(const JournalState.empty()) {
    on<RegisterEvent>((event, emit) {});
    on<LoginEvent>((event, emit) async {
      emit(
        const JournalState(
          isHome: false,
          isLoading: true,
          loginError: null,
          journalEntries: null,
          loginToken: null,
        ),
      );
      final loginToken = await loginServices.login(
        email: event.email,
        password: event.password,
      );
      emit(
        JournalState(
          isHome: false,
          isLoading: false,
          loginError: loginToken == null ? LoginError.invalidCredentials : null,
          journalEntries: null,
          loginToken: loginToken,
        ),
      );
    });
    on<GetJournalEvent>((event, emit) async {
      emit(
        JournalState(
          isHome: false,
          isLoading: true,
          loginError: null,
          journalEntries: null,
          loginToken: state.loginToken,
        ),
      );
      final token = state.loginToken;
      if (token != const LoginToken.success()) {
        emit(
          JournalState(
            isHome: false,
            isLoading: false,
            loginError: LoginError.invalidCredentials,
            journalEntries: null,
            loginToken: token,
          ),
        );
      }
      final journals = await getJournalService.getJournals(token: token!);
      emit(
        JournalState(
          isHome: true,
          isLoading: false,
          loginError: null,
          journalEntries: journals,
          loginToken: token,
        ),
      );
    });
  }
}
