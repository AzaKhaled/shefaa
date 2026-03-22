import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Home Screen'),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('This is the Home Screen'),
      ),
    );
  }
}