import 'package:flutter/material.dart';

import '../../core/services/navigation_service.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenTwo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Route to Screen One"),
            ElevatedButton(
              onPressed: () {
                NavigationService.instance.pop();
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
