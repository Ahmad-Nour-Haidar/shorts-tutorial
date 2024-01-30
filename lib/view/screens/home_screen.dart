import 'package:flutter/material.dart';
import 'package:shorts_tutorial/core/crud/crud.dart';
import 'package:shorts_tutorial/print.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          const url = 'http://10.0.2.2:8000/api/authors';
          final r = await Crud().sendRequest(
            url: url,
            methodType: MethodType.get,
          );
          r.fold((l) {
            printme.red('State: $l');
            printme.red('message: ${l.message}');
          }, (r) {});
        },
      ),
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
    );
  }
}
