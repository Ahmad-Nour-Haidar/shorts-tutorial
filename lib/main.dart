import 'package:flutter/material.dart';
import 'package:shorts_tutorial/core/services/navigation_service.dart';

import 'core/navigation/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: AppRoute.routes,
      initialRoute: AppRoute.initRoute,
      title: 'Shorts Tutorial',
      // home: const HomeScreen(),
    );
  }
}
