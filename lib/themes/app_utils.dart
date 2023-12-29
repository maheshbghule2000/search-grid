import 'package:flutter/material.dart';

void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

extension StringExtension on String {
  String truncateTo(int maxLength) =>
      (length <= maxLength) ? this : '${substring(0, maxLength)}...';
}
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
