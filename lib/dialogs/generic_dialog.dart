import 'package:flutter/material.dart';

typedef OptionsLoader<T> = Map<String, T?> Function();

Future<T?> showCustomDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required OptionsLoader optionsLoader,
}) {
  return showDialog<T?>(
    context: context,
    builder: ((context) {
      final options = optionsLoader();
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          ...options.keys.map(
            (option) => TextButton(
              onPressed: () {
                final value = options[option];
                if (value != null) {
                  Navigator.of(context).pop(value);
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Text(option),
            ),
          ),
        ],
      );
    }),
  );
}
