import 'package:flutter/material.dart';
import '../../view/screens/screen_one.dart';
import '../../view/screens/screen_two.dart';

abstract class AppRoute {
  static const initRoute = screenOne;
  static const screenOne = 'screenOne';
  static const screenTwo = 'screenTwo';

  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case screenOne:
        return MaterialPageRoute(builder: (context) => const ScreenOne());
      case screenTwo:
        return MaterialPageRoute(builder: (context) => const ScreenTwo());

      default:
        return _defaultMaterialPageRoute(settings);
    }
  }

  static MaterialPageRoute<dynamic> _defaultMaterialPageRoute(
      RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text("Not found ${settings.name}"),
        ),
      ),
    );
  }
}
