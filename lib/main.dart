import 'package:flutter/material.dart';
import 'package:meals_app/features/onboarding/onboarding_screen.dart';

void main() {
  runApp(MealsApp());
}

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName,
      routes: {OnboardingScreen.routeName: (context) => OnboardingScreen()},
    );
  }
}
