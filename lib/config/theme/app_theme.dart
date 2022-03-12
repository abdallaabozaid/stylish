import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/config/theme/color_scheme.dart';
import 'package:stylish/config/colors.dart';

class AppThemeClass {
  static ThemeData appLightTheme = ThemeData(
    ////////////////////////////////////////////////////////////////////////
    ////// color scheme
    colorScheme: lightColorScheme,
    backgroundColor: const Color(0xffE5E5E5),
    brightness: Brightness.light,

    ////////////////////////////////////////////////////////////////////////
    /// scaffold
    scaffoldBackgroundColor: const Color(0xffE5E5E5),

    ////////////////////////////////////////////////////////////////////////
    ///text and font
    fontFamily: 'Gordita',
    textTheme: TextTheme(
      headline1: TextStyle(
        // color: Colors.black,
        fontSize: 22.sp,
        fontWeight: FontWeight.w800,
      ),
      headline2: TextStyle(
        color: Colors.black.withOpacity(0.5),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
      headline4: TextStyle(
        // color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
      ),
      headline5: TextStyle(
        color: Colors.black.withOpacity(0.5),
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        // color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    ),

    ///
    /// ElevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(133.r),
            ),
          ),
        ),
      ),
    ),

    ////
    //// CheckboxTheme
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(AppColors.mainOrange),
      checkColor: MaterialStateProperty.all(Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      side: BorderSide(
        color: AppColors.mainOrange,
        width: 1,
      ),
    ),

    ////
    ///bottom sheet theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
  );

  static ThemeData appDarkTheme = ThemeData(
    ////////////////////////////////////////////////////////////////////////
    ////// color scheme
    colorScheme: darkColorScheme,

    backgroundColor: const Color(0xffE5E5E5),

    brightness: Brightness.dark,

    ////////////////////////////////////////////////////////////////////////
    /// scaffold
    scaffoldBackgroundColor: const Color.fromARGB(255, 51, 0, 0),

    ////////////////////////////////////////////////////////////////////////
    ///text and font
    fontFamily: 'Gordita',
    textTheme: TextTheme(
      headline1: TextStyle(
        // color: Colors.black,
        fontSize: 22.sp,
        fontWeight: FontWeight.w800,
      ),
      headline2: TextStyle(
        color: Colors.black.withOpacity(0.5),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
      headline4: TextStyle(
        // color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
      ),
      headline5: TextStyle(
        color: Colors.black.withOpacity(0.5),
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
      ),
      headline6: TextStyle(
        // color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        // color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    ),

    ///
    /// ElevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // backgroundColor: MaterialStateProperty.all(
        //   const Color(0xffF67952),
        // ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(133.r),
            ),
          ),
        ),
      ),
    ),

    ////
    //// CheckboxTheme
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(AppColors.mainOrange),
      checkColor: MaterialStateProperty.all(Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      side: BorderSide(
        color: AppColors.mainOrange,
        width: 1,
      ),
    ),

    ////
    ///tab bar theme
    // tabBarTheme: TabBarTheme(
    //   indicator: BoxDecoration(color: Colors.red),
    // ),

    ////
    ///bottom sheet theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
  );

  static SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color(0xFFFFFFFF),
  );

  static void changeNavBarColor(BuildContext context, bool white) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: white
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.background,
      ),
    );
  }
}
