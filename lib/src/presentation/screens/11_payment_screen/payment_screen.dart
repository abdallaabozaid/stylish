import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/config/const.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, mainHomeScreen);
        return true;
      },
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 95.h,
                ),
                _mainHeader(themeData),
                SizedBox(
                  height: 85.h,
                ),
                _bodyText(themeData),
                SizedBox(
                  height: 30.h,
                ),
                _button(
                  themeData,
                  title: 'Get your receipt',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                _button(
                  themeData,
                  title: 'Back to Home',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, mainHomeScreen);
                  },
                  primary: themeData.colorScheme.primary.withOpacity(0.2),
                  onPrimary: themeData.colorScheme.primary,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _mainHeader(ThemeData themeData) {
    return Container(
      width: 210.w,
      height: 210.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: themeData.colorScheme.primary,
          width: 8,
        ),
      ),
      child: Container(
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: themeData.colorScheme.primary.withOpacity(0.2),
        ),
        child: Icon(
          Icons.check,
          size: 50,
          color: themeData.colorScheme.primary,
        ),
      ),
    );
  }

  Widget _bodyText(ThemeData themeData) {
    return Column(
      children: [
        Text(
          'Congratulation!!!',
          style: themeData.textTheme.headline1!.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Payment is the transfer of money services in exchange product or Payments ',
          style: themeData.textTheme.headline2!.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _button(
    ThemeData themeData, {
    required String title,
    required VoidCallback onPressed,
    Color? primary,
    Color? onPrimary,
    Color? shadowColor,
    double? elevation,
  }) {
    return SizedBox(
      width: 233.w,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
        ),
        style: ElevatedButton.styleFrom(
          primary: primary,
          onPrimary: onPrimary,
          elevation: elevation,
          shadowColor: shadowColor,
        ),
      ),
    );
  }
}
