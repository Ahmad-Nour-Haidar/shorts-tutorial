import 'package:flutter/material.dart';
import 'package:shorts_tutorial/view/screens/login_screen.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

void main() async {
  IO.Socket socket = IO.io('http://10.0.2.2:8000', {
    "transports": ["websocket"],
    "autoConnect": false,
  });
  socket.connect();
  socket.onConnect((_) {
    print('connect');
    socket.emit('msg', 'test');
  });
  socket.on('event', (data) => print(data));
  socket.onDisconnect((_) => print('disconnect'));
  socket.on('fromServer', (_) => print(_));

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
      home: LoginScreen(),
    );
  }
}
