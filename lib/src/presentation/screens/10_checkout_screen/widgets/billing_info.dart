import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../logic/user_info/user_info_cubit/user_info_cubit.dart';

class BillingInfo extends StatelessWidget {
  const BillingInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final int subtotal =
        BlocProvider.of<UserInfoCubit>(context).subTotalPrice();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleText(themeData),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          height: 150.h,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _infoLine(
                themeData,
                key: 'Delivery Fee     : ',
                value: 50,
              ),
              _infoLine(
                themeData,
                key: 'Subtotal            : ',
                value: subtotal,
              ),
              _infoLine(
                themeData,
                key: 'Total                  : ',
                value: 50 + subtotal,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _titleText(ThemeData themeData) {
    return Text(
      'Billing information',
      style: themeData.textTheme.headline1!.copyWith(fontSize: 18.sp),
    );
  }

  Widget _infoLine(ThemeData themeData,
      {required String key, required int value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: themeData.textTheme.headline2!.copyWith(fontSize: 14),
        ),
        Text(
          "\$${value.toString()}",
          style: themeData.textTheme.headline1!.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
