import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(const BottomNavigationState(index: 0));

  void navigatoTo(int index) {
    emit(
      BottomNavigationState(index: index),
    );
  }
}
