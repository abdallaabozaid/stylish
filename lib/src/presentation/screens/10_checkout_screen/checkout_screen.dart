import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/config/const.dart';
import 'package:stylish/config/theme/app_theme.dart';
import 'package:stylish/src/data/model/cart_item_model.dart';
import 'package:stylish/src/logic/orders/cubit/orders_cubit.dart';
import 'package:stylish/src/logic/user_info/user_info_cubit/user_info_cubit.dart';

import 'widgets/billing_info.dart';
import 'widgets/delivery_adress.dart';
import 'widgets/payment_method.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppThemeClass.changeNavBarColor(context, false);
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        // controller: controller,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              _appBar(context, themeData),
              SizedBox(
                height: 30.h,
              ),
              const DeliveryAdress(),
              SizedBox(
                height: 18.h,
              ),
              const BillingInfo(),
              SizedBox(
                height: 18.h,
              ),
              const PaymentMethod(),
              Align(
                child: _swipeToCheckout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _swipeToCheckout(BuildContext context) {
    return SizedBox(
      width: 230.w,
      height: 80.h,
      child: ElevatedButton(
        onPressed: () {},
        child: _dismissIcon(context),
      ),
    );
  }

  Widget _dismissIcon(BuildContext context) {
    return Align(
      // alignment: Alignment.centerLeft,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          SizedBox(
            height: 80.h,
            width: 200.w,
          ),
          _dismissText(context),
          SizedBox(
            child: Dismissible(
              background: Container(
                // color: Theme.of(context).colorScheme.primary,
                alignment: Alignment.center,
              ),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                final List<CartItem> cartItems =
                    BlocProvider.of<UserInfoCubit>(context)
                        .userModel
                        .cartItems!
                        .values
                        .toList();
                final int subtotal =
                    BlocProvider.of<UserInfoCubit>(context).subTotalPrice();
                BlocProvider.of<OrdersCubit>(context)
                    .addOrder(cartItems, 50 + subtotal);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  paymentScreen,
                  (route) => false,
                );
                BlocProvider.of<UserInfoCubit>(context).clearCart();
              },
              key: const ValueKey('dismissIconKey'),
              child: Container(
                height: 60.h,
                width: 150.w,
                alignment: Alignment.centerLeft,
                constraints: const BoxConstraints(),
                // color: Colors.red,
                child: Container(
                  constraints: const BoxConstraints(),
                  width: 45.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dismissText(BuildContext context) {
    return const Positioned(right: 0, child: Text('Swipe for Payment'));
  }

  Widget _appBar(BuildContext context, ThemeData themeData) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top + 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios_new_rounded)),
            Text(
              'Checkout',
              style: themeData.textTheme.headline1,
            ),
            const Opacity(
                opacity: 0, child: Icon(Icons.arrow_back_ios_new_rounded)),
          ],
        ),
      ],
    );
  }
}
