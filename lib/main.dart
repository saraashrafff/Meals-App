import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/home/home_screen.dart';
import 'package:meals_app/features/onboarding/onboarding_screen.dart';
import 'package:meals_app/features/splash/splash_screen.dart';
import 'package:meals_app/meal_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstRun = prefs.getBool('isFirstRun') ?? true;
  print("DEBUG >>> isFirstRun = $isFirstRun");

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MealsApp(isFirstRun: isFirstRun),
    ),
  );
}

class MealsApp extends StatelessWidget {
  final bool isFirstRun;
  const MealsApp({super.key, required this.isFirstRun});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          // home: isFirstRun ? OnboardingScreen() : HomeScreen(),
          initialRoute: isFirstRun
              ? OnboardingScreen.routeName
              : HomeScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            OnboardingScreen.routeName: (context) => OnboardingScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            MealDetailsScreen.routeName: (context) => MealDetailsScreen(),
          },
        );
      },
    );
  }
}
