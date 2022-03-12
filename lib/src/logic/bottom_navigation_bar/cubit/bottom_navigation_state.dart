part of 'bottom_navigation_cubit.dart';

class BottomNavigationState extends Equatable {
  final int index;

  const BottomNavigationState({required this.index});
  @override
  List<Object> get props => [index];
}

// class BottomNavigationIndex extends BottomNavigationState {
//   final int index;

//   BottomNavigationIndex({required this.index});
// }
