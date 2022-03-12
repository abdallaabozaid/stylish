import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/config/const.dart';
import 'package:stylish/config/enums.dart';
import 'package:stylish/src/logic/auth/cubit/auth_cubit.dart';
import 'package:stylish/src/presentation/common_widgets/app_common_commands.dart';
import 'package:stylish/src/presentation/screens/02_log_in_screen/widgets/login_form.dart';
import 'package:stylish/src/presentation/screens/02_log_in_screen/widgets/social_login.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  FormType _formType = FormType.signUp;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return false;
      },
      child: GestureDetector(
        onTap: () => AppCommonCommands.dismissKeyBoard(context),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: BlocBuilder<AuthCubit, AuthState>(
                  buildWhen: (previous, current) =>
                      current is FormToggled && previous != current,
                  builder: (context, state) {
                    // _formType = BlocProvider.of<AuthCubit>(context).formType;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _logo(),
                        _loginText(context, formType: _formType),
                        Loginform(formType: _formType),
                        _or(formType: _formType),
                        const SocialLogin(),
                        SizedBox(
                            height: _formType == FormType.signIn ? 50.h : 20.h),
                        _trailingText(context, formType: _formType),
                        SizedBox(
                          height: 20.h,
                        ),
                        _buildAuthBlocListener(),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAuthBlocListener() {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is FormToggled && previous != current,
      listener: (context, state) {
        if (state is FormToggled) {
          _formType = state.formType;
        }
      },
      child: Container(),
    );
  }

  Widget _logo() {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Image.asset(
          logo,
          width: 54.w,
          height: 62.h,
        ),
        SizedBox(
          height: 22.h,
        ),
      ],
    );
  }

  Widget _loginText(BuildContext context, {required FormType formType}) {
    return Text(
      formType == FormType.signIn ? 'Log in' : 'Sign Up',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Widget _or({required FormType formType}) {
    final Widget divider = Container(
      height: 2.h,
      width: 89.w,
      color: const Color(0xff232E24).withOpacity(0.6),
    );
    return Column(
      children: [
        SizedBox(
          height: formType == FormType.signIn ? 44.h : 18.h,
        ),
        SizedBox(
          width: 232.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              divider,
              const Text('Or'),
              divider,
            ],
          ),
        ),
        SizedBox(
          height: formType == FormType.signIn ? 34.h : 20.h,
        ),
      ],
    );
  }

  Widget _trailingText(BuildContext context, {required FormType formType}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          formType == FormType.signIn
              ? 'Don’t have an account?'
              : 'Already have an account?',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.end,
        ),
        InkWell(
          onTap: () {
            BlocProvider.of<AuthCubit>(context).toggleForm(formType);
            BlocProvider.of<AuthCubit>(context).toggleValidationtype(true);
          },
          child: Text(
            formType == FormType.signIn ? ' Sign Up' : ' Log In',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
