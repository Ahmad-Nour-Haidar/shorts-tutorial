import 'package:flutter/cupertino.dart';

final class NavigationService {
  NavigationService._();

  static final instance = NavigationService._();
  final navigatorKey = GlobalKey<NavigatorState>();

  Future<Object?>? pushNamed(String route, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: arguments);
  }

  Future<Object?>? pushNamedAndRemoveUntil(String route, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      route, (route) => false, // This will remove all screens
      arguments: arguments,
    );
  }

  void pop() => navigatorKey.currentState?.pop();
}
