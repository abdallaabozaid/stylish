import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/src/data/model/product_model.dart';

import '../../../logic/user_info/user_info_cubit/user_info_cubit.dart';
import 'favorite_item_builder.dart';

// ignore: must_be_immutable
class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  List<ProductModel> favProducts = [];
  @override
  Widget build(BuildContext context) {
    favProducts =
        BlocProvider.of<UserInfoCubit>(context).userModel.favoriteProducts ??
            favProducts;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          _header(context),
          FavoriteItemsViewer(
            products: favProducts,
          ),
        ],
      )),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      height: 100.h,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 8.0.h, left: 20.w, right: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _favoriteText(context),
          ],
        ),
      ),
    );
  }

  Widget _favoriteText(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        return Text(
          'Favorites',
          style:
              Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24.sp),
        );
      },
    );
  }

  // Widget _backIcon(BuildContext context) {
  //   return IconButton(
  //     constraints: const BoxConstraints(),
  //     padding: EdgeInsets.zero,
  //     splashColor: Colors.transparent,
  //     highlightColor: Colors.transparent,
  //     icon: Image.asset(
  //       'assets/icons/back.png',
  //       width: 50.w,
  //       height: 50.h,
  //     ),
  //     onPressed: () {
  //       BlocProvider.of<BottomNavigationCubit>(context).navigatoTo(0);
  //     },
  //   );
  // }
}
