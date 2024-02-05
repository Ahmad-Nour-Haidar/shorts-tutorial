import 'package:flutter/material.dart';
import 'package:shorts_tutorial/core/navigation/route_generator.dart';
import 'package:shorts_tutorial/core/services/navigation_service.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenOne'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Route to Screen Two"),
            ElevatedButton(
              onPressed: () {
                NavigationService.instance.pushNamed(AppRoute.screenTwo);
              },
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
