import 'package:flutter/material.dart';
import 'package:shefaa/features/appointment/presentation/screen/appointmen_screen.dart';
import 'package:shefaa/features/doctors/presentation/screen/doctors_screen.dart';
import 'package:shefaa/features/guest/presentation/screen/guest_screen.dart';
import 'package:shefaa/features/home/presentation/screen/home_screen.dart';
import 'package:shefaa/features/register/presentation/screen/widget/otp_screen.dart';
import '../../../features/login/presentation/screen/login_screen.dart';
import 'package:shefaa/features/profile/presentation/screen/profile_screen.dart';
import 'package:shefaa/features/register/presentation/screen/register_screen.dart';
import 'package:shefaa/features/onboarding/presentation/screen/onboarding_screen.dart';

import '../../../features/splash/presentation/screen/splash_screen.dart';
import 'package:shefaa/features/root/presentation/screen/root_screen.dart';
import 'package:shefaa/features/appointment/presentation/screen/doctor_details_screen.dart';
import 'package:shefaa/features/appointment/presentation/screen/book_appointment_screen.dart';

class Routes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String appointment = '/appointment';
  static const String doctors = '/doctors';
  static const String profile = '/profile';
  static const String guest = '/guest';
  static const String otp = '/otp';
  static const String root = '/root';
  static const String doctorDetails = '/doctor_details';
  static const String bookAppointment = '/book_appointment';
  static Map<String, WidgetBuilder> get routes => {
    login: (context) => LoginScreen(),
    home: (context) => const HomeScreen(),
    register: (context) => RegisterScreen(),
    onboarding: (context) => const OnboardingScreen(),
    splash: (context) => SplashScreen(),
    appointment: (context) => AppointmenScreen(),
    doctors: (context) => DoctorsScreen(),
    profile: (context) => ProfileScreen(),
    guest: (context) => GuestScreen(),
    otp:(context) => OtpVerificationScreen(),
    root:(context) => const RootScreen(),
    doctorDetails:(context) => const DoctorDetailsScreen(),
    bookAppointment:(context) => const BookAppointmentScreen(),
  };
}
