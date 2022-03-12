import 'package:flutter/material.dart';
import 'package:stylish/config/theme/app_theme.dart';

import 'package:stylish/src/presentation/screens/00_splash_screen/splash_screen.dart';
import 'package:stylish/src/presentation/screens/01_on_boarding_screen/on_boarding_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  Future<void> _delay(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    AppThemeClass.changeNavBarColor(context, false);

    return FutureBuilder(
      future: _delay(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else {
          return OnBoardingScreen();
        }
      },
    );
  }
}
