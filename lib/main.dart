import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steep_journal_login_bloc_practice/bloc/journal_bloc.dart';
import 'package:steep_journal_login_bloc_practice/screen/default_screen.dart';
import 'package:steep_journal_login_bloc_practice/services/auth_service.dart';
import 'package:steep_journal_login_bloc_practice/services/get_journal_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JournalBloc(
        loginServices: LoginService(),
        getJournalService: GetJournalService(),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DefaultScreen(),
      ),
    );
  }
}
