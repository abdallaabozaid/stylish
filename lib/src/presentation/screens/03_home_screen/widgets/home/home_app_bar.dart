import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:stylish/config/theme/app_theme.dart';
import 'package:stylish/src/data/model/cart_item_model.dart';

import '../../../../../../config/const.dart';
import '../../../../../logic/user_info/user_info_cubit/user_info_cubit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
    required this.fromHomeScreen,
  }) : super(key: key);
  final bool fromHomeScreen;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'app bar',
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 100.h,
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 8.0.h, left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _drawerIcon(context),
                _notificationIcon(context, true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawerIcon(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Image.asset(
        fromHomeScreen ? drawerIcon : backIcon,
        width: 27.w,
        height: 16.h,
      ),
      onPressed: () {
        if (fromHomeScreen) {
          ZoomDrawer.of(context)!.toggle();
        } else {
          AppThemeClass.changeNavBarColor(context, true);
          Navigator.pop(context);
        }
      },
    );
  }

  Widget _notificationIcon(BuildContext context, bool newNotification) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, cartScreen),
      child: Container(
        width: 42.w,
        height: 38.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: BlocBuilder<UserInfoCubit, UserInfoState>(
          buildWhen: (previous, current) =>
              current is UserCartItemsChange || current is UserCartItemsEmpty,
          builder: (context, state) {
            final Map<String, CartItem> cartItems =
                BlocProvider.of<UserInfoCubit>(context).userModel.cartItems!;
            final int cartItemsCount = cartItems.keys.toList().length;
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 42.w,
                  height: 38.h,
                ),
                const Icon(
                  Icons.shopping_basket,
                ),
                if (cartItemsCount != 0)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 17.w,
                      height: 19.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.primary,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onPrimary,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          cartItemsCount.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontSize: 10.sp),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
