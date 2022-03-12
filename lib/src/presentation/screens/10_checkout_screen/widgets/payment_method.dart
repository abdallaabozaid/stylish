import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'method_item.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int currentlySelected = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleText(themeData),
        _methods(),
      ],
    );
  }

  Widget _titleText(ThemeData themeData) {
    return Text(
      'Payment Method',
      style: themeData.textTheme.headline1!.copyWith(fontSize: 18.sp),
    );
  }

  Widget _methods() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 70.h,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: methods.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                currentlySelected = index;
              });
            },
            child: MethodItem(
                image: methods[index], selected: currentlySelected == index),
          );
        },
      ),
    );
  }

  final List<String> methods = [
    'assets/images/payment_methods/apple_pay.png',
    'assets/images/payment_methods/mastercard.png',
    'assets/images/payment_methods/paypal.png',
    'assets/images/payment_methods/visa.png',
  ];
}
