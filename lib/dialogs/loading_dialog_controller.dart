import 'package:flutter/foundation.dart';

typedef CloseLoading = bool Function();
typedef UpdateLoading = bool Function(String text);

@immutable
class LoadingDialogController {
  final CloseLoading close;
  final UpdateLoading update;

  const LoadingDialogController({
    required this.close,
    required this.update,
  });
}
