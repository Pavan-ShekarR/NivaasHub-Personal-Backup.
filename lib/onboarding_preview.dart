import 'package:flutter/material.dart';
import 'screens/onboarding/onboarding_screen_two.dart';
import 'screens/onboarding/onboarding_screen_five.dart';
import 'screens/onboarding/login_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
    // home: LoginScreen(),
     //home: OnboardingScreenTwo(),
     home: OnboardingScreenFive(),
    ),
  );
}