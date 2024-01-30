import 'dart:async';

import 'package:flutter/material.dart';
import 'package:steep_journal_login_bloc_practice/dialogs/loading_dialog_controller.dart';

class LoadingDialog {
  LoadingDialog._sharedInstance();
  static final _shared = LoadingDialog._sharedInstance();
  factory LoadingDialog.instance() => _shared;

  LoadingDialogController? _controller;
  void show({
    required BuildContext context,
    required String text,
  }) {
    if (_controller?.update(text) ?? false) {
      return;
    } else {
      _controller = _showOverlay(
        context: context,
        text: text,
      );
    }
  }

  void hide() {
    _controller?.close();
    _controller = null;
  }

  LoadingDialogController _showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final text0 = StreamController<String>();
    text0.add(text);
    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final entry = OverlayEntry(builder: ((context) {
      return Material(
        color: Colors.black.withAlpha(150),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white70),
            padding: const EdgeInsets.all(16),
            constraints: BoxConstraints(
              maxHeight: size.height * 0.7,
              maxWidth: size.width * 0.6,
              minWidth: size.width * 0.4,
            ),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const CircularProgressIndicator(),
                    StreamBuilder(
                        stream: text0.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data!);
                          } else {
                            return const SizedBox();
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }));
    state.insert(entry);
    return LoadingDialogController(close: () {
      text0.close();
      entry.remove();
      return true;
    }, update: (text) {
      text0.add(text);
      return true;
    });
  }
}
