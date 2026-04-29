import 'package:flutter/material.dart';

extension NavigationExtensions on BuildContext {
  void push(Widget page) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void pushReplacement(Widget page) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void pushAndRemoveUntil(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  void pop() => Navigator.of(this).pop();
}
