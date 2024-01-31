import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shorts_tutorial/core/crud/crud.dart';
import 'package:shorts_tutorial/core/services/dependency_injection.dart';
import 'package:shorts_tutorial/print.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          const url = 'http://10.0.2.2:8000/api/authors';
          // final file = await ImagePicker().pickImage(
          //   source: ImageSource.gallery,
          // );
          final r = await Crud().sendRequest(
            url: url,
            methodType: MethodType.get,
            data: {
              'email': 'asasws@gmail.com',
              'username': 'asassxsx',
              'password': 'aA#11111',
              'page': 4,
            },
            queryParameters:{'page': 4,}
            // nameKeyFile: 'image',
            // file: File(file?.path ?? ''),
          );
          r.fold((l) {
            printme.red('State: $l');
            printme.red('Message: ${l.message}');
          }, (r) {});
        },
      ),
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
    );
  }
}
