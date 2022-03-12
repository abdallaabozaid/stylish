import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stylish/src/data/model/cart_item_model.dart';

import '../../../../logic/user_info/user_info_cubit/user_info_cubit.dart';
import 'cart_item_card.dart';

// ignore: must_be_immutable
class CartItemsBuilder extends StatelessWidget {
  CartItemsBuilder({Key? key}) : super(key: key);

  late List<CartItem> cartItems;
  late List<String> cartIds;

  @override
  Widget build(BuildContext context) {
    cartItems = BlocProvider.of<UserInfoCubit>(context)
        .userModel
        .cartItems!
        .values
        .toList();

    cartIds = BlocProvider.of<UserInfoCubit>(context)
        .userModel
        .cartItems!
        .keys
        .toList();
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        cartItems = BlocProvider.of<UserInfoCubit>(context)
            .userModel
            .cartItems!
            .values
            .toList();

        cartIds = BlocProvider.of<UserInfoCubit>(context)
            .userModel
            .cartItems!
            .keys
            .toList();
        return Column(
          children: [
            cartItems.isNotEmpty
                ? AnimationLimiter(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: SlideAnimation(
                              child: CartItemCard(
                                productId: cartIds[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : _emptyCart(),
            if (cartItems.isNotEmpty) _subTotalPrice(context),
          ],
        );
      },
    );
  }

  Widget _subTotalPrice(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Subtotal   :',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w400),
          ),
          BlocBuilder<UserInfoCubit, UserInfoState>(
            builder: (context, state) {
              int subtotal =
                  BlocProvider.of<UserInfoCubit>(context).subTotalPrice();

              return Text(
                "\$${subtotal.toString()}",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w600),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _emptyCart() {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: Text('Cart is Empty .. Go shopping'),
    );
  }
}
