import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/config/enums.dart';
import 'package:stylish/config/theme/app_theme.dart';
import 'package:stylish/src/logic/auth/cubit/auth_cubit.dart';

import '../../../../../config/const.dart';

class Loginform extends StatefulWidget {
  const Loginform({
    Key? key,
    required this.formType,
  }) : super(key: key);
  final FormType formType;

  @override
  State<Loginform> createState() => _LoginformState();
}

class _LoginformState extends State<Loginform> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  bool _isObscure = true;
  bool _isChecked = false;
  bool _startValidating = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          current is FormToggled || current is ValidationTypeToggled,
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: _startValidating
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              SizedBox(
                height: 33.h,
              ),
              if (widget.formType == FormType.signUp)
                SizedBox(
                  // height: 100.h,
                  child: _textFormField(
                    hintText: 'Name',
                    iconAsset: 'name',
                    validator: _namevalidator,
                    controller: _nameTextController,
                  ),
                ),
              if (widget.formType == FormType.signUp)
                SizedBox(
                  height: 11.h,
                ),
              SizedBox(
                // height: 100.h,
                child: _textFormField(
                  hintText: 'Email',
                  iconAsset: 'email',
                  validator: _emailvalidator,
                  controller: _emailTextController,
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              SizedBox(
                // height: 100.h,
                child: _textFormField(
                  hintText: 'Password',
                  iconAsset: 'password',
                  validator: _passwordValidator,
                  controller: _passwordTextController,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              widget.formType == FormType.signIn
                  ? _forgotPassword(context)
                  : _acceptTermsCheckBox(context),
              SizedBox(
                height: 18.h,
              ),
              _loginButton(context, formType: FormType.signUp),
              _buildAuthBlocListener(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAuthBlocListener() {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is FormToggled && previous != current ||
          current is ValidationTypeToggled,
      listener: (context, state) {
        if (state is FormToggled) {
          _startValidating = false;
          _formKey.currentState!.reset();
        }
        if (state is ValidationTypeToggled) {
          _startValidating = state.isValidating;
        }
      },
      child: Container(),
    );
  }

  Widget _loginButton(BuildContext context, {required FormType formType}) {
    return SizedBox(
      width: 205.w,
      height: 60.h,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushReplacementNamed(context, mainHomeScreen);
            AppThemeClass.changeNavBarColor(context, true);
          } else {
            BlocProvider.of<AuthCubit>(context)
                .toggleValidationtype(_startValidating);
            return;
          }
        },
        child: Text(
          formType == FormType.signIn ? 'Log in' : 'Sign Up',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }

  TextFormField _textFormField({
    required String hintText,
    required String iconAsset,
    required TextEditingController? controller,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: hintText == 'Password'
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              )
            : null,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.w),
          child: Image.asset(
            'assets/icons/$iconAsset.png',
            width: 48.w,
            height: 45.h,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: hintText == 'Email'
          ? TextInputType.emailAddress
          : hintText == 'Name'
              ? TextInputType.name
              : TextInputType.visiblePassword,
      textInputAction:
          hintText == 'Password' ? TextInputAction.done : TextInputAction.next,
      obscureText: hintText == 'Password' ? _isObscure : false,
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(
        'Forgot password?',
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.end,
      ),
    );
  }

  Widget _acceptTermsCheckBox(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16.w,
          height: 16.h,
          child: Checkbox(
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value!;
              });
            },
          ),
        ),
        Text(
          '   I accept all the ',
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          'Terms & Conditions',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }

  String? _namevalidator(String? value) {
    if (value!.isEmpty) {
      return 'please enter your name';
    } else if (value.characters.length < 4) {
      return 'too short name';
    } else {
      return null;
    }
  }

  String? _emailvalidator(String? value) {
    if (value!.isEmpty) {
      return 'please enter your E-mail';
    } else if (!value.contains('@')) {
      return 'Invalid email !';
    } else if (!value.contains('.com')) {
      return 'Invalid email !';
    } else if (value.contains(' ')) {
      return 'Invalid email !';
    } else {
      return null;
    }
  }

  String? _passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'please enter your password';
    } else if (value.characters.length < 6) {
      return 'too short password !';
    } else {
      return null;
    }
  }
}
