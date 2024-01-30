import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/journal_model.dart';

class JournalsListView extends StatelessWidget {
  const JournalsListView({super.key, required this.journals});
  final List<Journal> journals;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: journals.length,
      itemBuilder: (context, index) {
        final journal = journals[index];
        final date = DateFormat.d().format(DateTime.parse(journal.dateTime));
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: journal.color,
              radius: 30,
              child: Text(date),
            ),
            title: Text(journal.text),
            subtitle: Text(
                DateFormat.MMMEd().format(DateTime.parse(journal.dateTime))),
          ),
        );
      },
    );
  }
}
