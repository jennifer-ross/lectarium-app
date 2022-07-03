import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'locator.dart';

bool isEmpty(dynamic value) {
  return ["", null, false, 0].contains(value);
}

void showGlobalError(String value) {
  GlobalKey<ScaffoldMessengerState> scaffold =
      locator.get<GlobalKey<ScaffoldMessengerState>>(instanceName: 'scaffold');

  scaffold.currentState?.activate();
  scaffold.currentState?.showSnackBar(SnackBar(
    backgroundColor: Colors.black,
    content: Text(
      value,
      style: const TextStyle(color: Colors.redAccent),
    ),
    action: SnackBarAction(
      textColor: Colors.white,
      label: 'OK',
      onPressed: () => hideGlobalError(),
    ),
  ));
}

void hideGlobalError() {
  GlobalKey<ScaffoldMessengerState> scaffold =
      locator.get<GlobalKey<ScaffoldMessengerState>>(instanceName: 'scaffold');

  scaffold.currentState?.hideCurrentSnackBar();
  scaffold.currentState?.deactivate();
}
