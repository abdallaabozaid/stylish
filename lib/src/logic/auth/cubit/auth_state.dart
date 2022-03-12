part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class FormToggled extends AuthState {
  final FormType formType;

  const FormToggled(this.formType);

  @override
  List<Object> get props => [formType];
}

class ValidationTypeToggled extends AuthState {
  final bool isValidating;

  const ValidationTypeToggled(this.isValidating);

  @override
  List<Object> get props => [isValidating];
}
