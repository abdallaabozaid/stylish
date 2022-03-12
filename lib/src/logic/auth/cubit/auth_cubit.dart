import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../config/enums.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool validationState = false;
  FormType formType = FormType.signIn;

  void toggleForm(FormType formType) {
    if (formType == FormType.signUp) {
      formType = FormType.signIn;
      emit(const FormToggled(FormType.signIn));
    } else {
      formType = FormType.signUp;
      emit(const FormToggled(FormType.signUp));
    }
  }

  void toggleValidationtype(bool isValidating) {
    isValidating = !isValidating;

    emit(ValidationTypeToggled(isValidating));
  }
}
