import 'package:flutter/material.dart';

class TokenProvider extends InheritedWidget {
  final String token;

  const TokenProvider({
    required this.token,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static TokenProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TokenProvider>();
  }

  @override
  bool updateShouldNotify(TokenProvider oldWidget) {
    return oldWidget.token != token;
  }
}
