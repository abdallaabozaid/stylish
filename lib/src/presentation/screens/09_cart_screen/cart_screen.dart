import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/config/const.dart';
import 'package:stylish/config/theme/app_theme.dart';
import 'package:stylish/src/presentation/screens/09_cart_screen/widgets/cart_items_builder.dart';

import '../../../logic/user_info/user_info_cubit/user_info_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppThemeClass.changeNavBarColor(context, false);
    ThemeData themeData = Theme.of(context);

    return WillPopScope(
      onWillPop: (() async {
        AppThemeClass.changeNavBarColor(context, true);
        return true;
      }),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 20,
              ),
              _appBar(context, themeData),
              CartItemsBuilder(),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
        bottomSheet: _checkOutButton(context),
      ),
    );
  }

  Widget _checkOutButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 140.h,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: SizedBox(
          height: 65.h,
          width: 253.w,
          child: BlocBuilder<UserInfoCubit, UserInfoState>(
            builder: (context, state) {
              bool _disabledBtn = BlocProvider.of<UserInfoCubit>(context)
                  .userModel
                  .cartItems!
                  .isEmpty;
              return ElevatedButton(
                onPressed: () {
                  if (_disabledBtn) {
                    return;
                  } else {
                    Navigator.pushNamed(context, checkoutScreen);
                  }
                },
                child: const Text('Checkout'),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context, ThemeData themeData) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new_rounded)),
          Text(
            'My Cart',
            style: themeData.textTheme.headline1,
          ),
          const Opacity(
              opacity: 0, child: Icon(Icons.arrow_back_ios_new_rounded)),
        ],
      ),
    );
  }
}
