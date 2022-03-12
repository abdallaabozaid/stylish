import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:stylish/config/theme/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState(
            themeData: AppThemeClass.appLightTheme,
          ),
        ) {
    on<ThemeEvent>(
      (event, emit) {
        if (event is ChangeTheme) {
          // ThemePreferences.saveLocalTheme(event.appTheme);
          if (state.themeData == AppThemeClass.appDarkTheme) {
            emit(
              ThemeState(
                themeData: AppThemeClass.appLightTheme,
              ),
            );
          } else {
            emit(
              ThemeState(
                themeData: AppThemeClass.appDarkTheme,
              ),
            );
          }
        }
      },
    );
  }
}
