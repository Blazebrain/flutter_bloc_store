import 'package:flutter/material.dart';

class AppNavigator {
  static final key = GlobalKey<NavigatorState>();
  static Future push(Widget page) {
    return key.currentState!.push(MaterialPageRoute(builder: (_) => page));
  }

  static Future pushNamed(String route, {arguments}) {
    return key.currentState!.pushNamed(route, arguments: arguments);
  }

  static Future pushNamedReplacement(String route, {arguments}) {
    return key.currentState!.pushReplacementNamed(route, arguments: arguments);
  }

  static void pop([results]) {
    return key.currentState!.pop(results);
  }
}
