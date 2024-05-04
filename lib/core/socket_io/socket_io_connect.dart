import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:dio/dio.dart';

@immutable
class SocketIOConnect {
  void connect() async{
    IO.Socket socket = IO.io('http://10.0.2.2:8000', {
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.onConnect((_) {
      print('connect');
    });
    socket.on('posts', (data) => print(data));
    socket.onDisconnect((_) => print('disconnect'));
  }
}
