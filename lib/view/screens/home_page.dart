import 'package:flutter/material.dart';
import 'package:shorts_tutorial/view/screens/login_screen.dart';

import '../widgets/custom_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 76,
        height: 76,
        child: FloatingActionButton.large(
          backgroundColor: Colors.black,
          shape: const OvalBorder(),
          onPressed: () {},
          child: const Icon(
            Icons.search,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: color,
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIcon(
                  onTap: () => setState(() => _currentPage = 0),
                  icon: Icons.home,
                  text: 'Home',
                  color: _currentPage == 0 ? color : Colors.black,
                ),
                CustomIcon(
                  onTap: () => setState(() => _currentPage = 1),
                  icon: Icons.message,
                  text: 'Message',
                  color: _currentPage == 1 ? color : Colors.black,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
