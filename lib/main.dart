import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/config/router.dart';
import 'package:stylish/config/theme/app_theme.dart';
import 'package:stylish/src/logic/blco_Providers.dart';
import 'package:stylish/src/logic/landing/landing_screen.dart';

import 'src/logic/theme/bloc/theme_bloc.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(AppThemeClass.systemUiOverlayStyle);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: () {
        return MultiBlocProvider(
          providers: AppBlocProviders.providers,
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Stylish',
                theme: state.themeData,
                onGenerateRoute: AppRouter.generateRoute,
                home: const LandingScreen(),
              );
            },
          ),
        );
      },
    );
  }
}
