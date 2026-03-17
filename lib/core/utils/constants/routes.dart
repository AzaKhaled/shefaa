import 'package:flutter/material.dart';
import 'package:shefaa/features/home/presentation/screen/home_screen.dart';
import 'package:shefaa/features/login/presentation/screen/login_screen.dart';
import 'package:shefaa/features/register/presentation/screen/register_screen.dart';
import 'package:shefaa/features/onboarding/presentation/screen/onboarding_screen.dart';

import '../../../features/splash/presentation/screen/splash_screen.dart';



class Routes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static Map<String, WidgetBuilder> get routes => {
   
   login: (context) =>  LoginScreen(),
    home: (context) => const HomeScreen(),
    register: (context) =>  RegisterScreen(),
    onboarding: (context) => const OnboardingScreen(),
    splash: (context) =>  SplashScreen(),
  };
}
