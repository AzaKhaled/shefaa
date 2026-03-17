import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryAction,
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: const Center(
        child: Text('This is the Login Screen'),
      ),
    );
  }
}