part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends ThemeEvent {
  // final ThemeData appTheme;

  // const ChangeTheme({
  //   required this.appTheme,
  // });
  // @override
  // List<Object> get props => [appTheme];
}
