import 'package:flutter/material.dart';
import 'package:shorts_tutorial/core/socket_io/socket_io_connect.dart';
import 'package:shorts_tutorial/view/screens/login_screen.dart';
import 'package:shorts_tutorial/view/screens/test_ussd.dart';

void main() async {
  SocketIOConnect().connect();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // navigatorKey: NavigationService.instance.navigatorKey,
      // onGenerateRoute: AppRoute.routes,
      // initialRoute: AppRoute.initRoute,
      title: 'Shorts Tutorial',
      home: TestUssd(),
    );
  }
}
