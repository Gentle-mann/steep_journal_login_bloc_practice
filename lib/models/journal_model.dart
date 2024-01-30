import 'package:flutter/material.dart' show Color, Colors;

class Journal {
  final String text;
  final String dateTime;
  final Color color;

  const Journal({
    required this.text,
    required this.dateTime,
    required this.color,
  });

  static final journals = [
    Journal(
      text: 'Today, I went to the beach with my parents. I had a lot of fun',
      dateTime: DateTime.now().subtract(const Duration(days: 1)).toString(),
      color: Colors.blue,
    ),
    Journal(
      text:
          'Today, I hung out with my friends at a restaurant. We took a lot of pictures',
      dateTime: DateTime.now().subtract(const Duration(days: 2)).toString(),
      color: Colors.red,
    ),
    Journal(
      text: 'Today, I went to the beach with my parents. I had a lot of fun',
      dateTime: DateTime.now().subtract(const Duration(days: 3)).toString(),
      color: Colors.green,
    ),
  ];
  // static final ab = Iterable.generate(
  //   1,
  //   (i) => Journal(text: '$i', dateTime: ''),
  // );
}
