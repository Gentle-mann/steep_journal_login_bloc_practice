import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steep_journal_login_bloc_practice/bloc/journal_bloc.dart';
import 'package:steep_journal_login_bloc_practice/bloc/journal_events.dart';
import 'package:steep_journal_login_bloc_practice/bloc/journal_state.dart';
import 'package:steep_journal_login_bloc_practice/dialogs/generic_dialog.dart';
import 'package:steep_journal_login_bloc_practice/dialogs/loading_dialog.dart';
import 'package:steep_journal_login_bloc_practice/models/login_token.dart';
import 'package:steep_journal_login_bloc_practice/views/journals_list_view.dart';
import 'package:steep_journal_login_bloc_practice/views/login_view.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JournalBloc, JournalState>(
      builder: (context, appState) {
        return Scaffold(
          appBar: AppBar(
            title: appState.isHome ? const Text('Home') : const Text('Auth'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: appState.journalEntries == null
                  ? LoginView(onPressed: (email, password) {
                      print('boy');
                      context.read<JournalBloc>().add(
                            LoginEvent(
                              email: email,
                              password: password,
                            ),
                          );
                    })
                  : JournalsListView(
                      journals: appState.journalEntries!.toList(),
                    ),
            ),
          ),
        );
      },
      listener: (context, appState) {
        if (appState.isLoading) {
          LoadingDialog.instance().show(
            context: context,
            text: 'Please wait',
          );
        } else {
          LoadingDialog.instance().hide();
        }
        final loginError = appState.loginError;
        if (loginError != null) {
          showCustomDialog(
            context: context,
            title: 'Login error',
            content: 'Invalid credentials',
            optionsLoader: () => {
              'OK': true,
              'Cancel': false,
            },
          );
        }
        print(
            'total: ${appState.isLoading == false && appState.isHome == false && appState.loginError == null && appState.loginToken == const LoginToken.success() && appState.journalEntries == null}');
        // print('start');
        // print('isLoading: ${appState.isLoading}');
        // print('isHome: ${appState.isHome}');
        // print('loginerror: ${appState.loginError}');
        // print('entires: ${appState.journalEntries}');
        // print('token: ${appState.loginToken.toString()}');
        // print('istoken: ${appState.loginToken == const LoginToken.success()}');
        // print('end');

        if (appState.isLoading == false &&
            appState.isHome == false &&
            appState.loginError == null &&
            appState.loginToken == const LoginToken.success() &&
            appState.journalEntries == null) {
          print('boss');
          context.read<JournalBloc>().add(
                const GetJournalEvent(),
              );
          print('boss 2');
        }
      },
    );
  }
}
