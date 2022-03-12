import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish/src/data/model/cart_item_model.dart';

import '../../../../logic/user_info/user_info_cubit/user_info_cubit.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    // required this.cartItem,
    required this.productId,
  }) : super(key: key);

  final String productId;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final CartItem cartItem = BlocProvider.of<UserInfoCubit>(context)
        .userModel
        .cartItems![productId]!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
      child: Dismissible(
        key: ValueKey(productId),
        direction: DismissDirection.endToStart,
        background: _backBasket(),
        onDismissed: (_) {
          _removaWholeCartItem(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
          width: 333.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: themeData.colorScheme.onPrimary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _cartItemImage(cartItem),
              SizedBox(
                width: 20.w,
              ),
              _middleInfo(themeData, cartItem),
              const Spacer(),
              _qntyInfo(themeData, context, cartItem),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cartItemImage(CartItem cartItem) {
    return Container(
      width: 85.w,
      height: 75.h,
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: cartItem.color.withOpacity(0.2),
      ),
      child: Image.asset(cartItem.image),
    );
  }

  Widget _middleInfo(ThemeData themeData, CartItem cartItem) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem.prductTitle,
          style: themeData.textTheme.headline2!.copyWith(fontSize: 15.sp),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          "\$${cartItem.price.toString()}",
          style: themeData.textTheme.headline1!.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _qntyInfo(
      ThemeData themeData, BuildContext context, CartItem cartItem) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _changeQnty(themeData, context, change: '+', onPressed: () {
          _addItem(context, cartItem);
        }),
        BlocBuilder<UserInfoCubit, UserInfoState>(
          buildWhen: (previous, current) => current is UserSingleCartItemChange,
          builder: (context, state) {
            final CartItem item = BlocProvider.of<UserInfoCubit>(context)
                .userModel
                .cartItems![productId]!;
            return Text(
              item.qnty.toString(),
              style: themeData.textTheme.headline1!.copyWith(fontSize: 10.sp),
            );
          },
        ),
        _changeQnty(themeData, context, change: '-', onPressed: () {
          _removeSingleItem(context);
        }),
      ],
    );
  }

  Widget _changeQnty(ThemeData themeData, BuildContext context,
      {required String change, required VoidCallback onPressed}) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        alignment: Alignment.center,
        width: 26.w,
        height: 22.h,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10.r)),
        child: Text(
          change,
          style: Theme.of(context).textTheme.headline1!.copyWith(
              color: Theme.of(context).colorScheme.primary, fontSize: 12.sp),
        ),
      ),
    );
  }

  void _addItem(BuildContext context, CartItem cartItem) {
    BlocProvider.of<UserInfoCubit>(context).addToCart(
      selectedColor: cartItem.color,
      image: cartItem.image,
      productId: productId,
      prductTitle: cartItem.prductTitle,
      price: cartItem.price,
    );
  }

  void _removeSingleItem(BuildContext context) {
    BlocProvider.of<UserInfoCubit>(context).removeSingleCartItem(productId);
  }

  void _removaWholeCartItem(BuildContext context) {
    BlocProvider.of<UserInfoCubit>(context).removeCartItem(productId);
  }

  Widget _backBasket() {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: const Icon(Icons.delete),
        ));
  }
}
