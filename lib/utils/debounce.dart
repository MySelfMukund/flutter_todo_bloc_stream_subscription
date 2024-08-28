//No more need this  file because we are alreay using the Event Transformer

import 'dart:async';

import 'package:flutter/material.dart';

class Debounce {
  final int miliSeconds;

  Debounce({this.miliSeconds = 500});
  Timer? _debounce;

  void run(VoidCallback actions) {
    if (_debounce != null) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: miliSeconds), actions);
  }
}
