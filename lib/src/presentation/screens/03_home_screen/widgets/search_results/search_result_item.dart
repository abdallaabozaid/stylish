import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish/src/data/model/product_model.dart';

import '../../../../../../config/const.dart';
import '../../../../../logic/user_info/user_info_cubit/user_info_cubit.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 220.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, productDetailsScreen,
              arguments: product);
        },
        child: Column(
          children: [
            _productsImage(context),
            _productName(context),
            _productPrice(context),
          ],
        ),
      ),
    );
  }

  Padding _productsImage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h, top: 10.h, left: 8.w, right: 8.w),
      child: Stack(
        children: [
          Container(
            width: 142.w,
            height: 150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: product.backGroundColor,
            ),
            child: Image.asset(
              product.selectedImage,
            ),
          ),
          _favoriteIcon(context)
        ],
      ),
    );
  }

  Positioned _favoriteIcon(BuildContext context) {
    return Positioned(
      right: 8.w,
      top: 7.h,
      child: InkWell(
        onTap: () {
          BlocProvider.of<UserInfoCubit>(context).favStatusChange(product);
          product.isFavorite = !product.isFavorite;
        },
        child: Container(
          width: 30.w,
          height: 30.h,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: BlocBuilder<UserInfoCubit, UserInfoState>(
            builder: (context, state) {
              return Image.asset(
                product.isFavorite
                    ? 'assets/icons/favorite.png'
                    : 'assets/icons/unfavorite.png',
                width: 18.w,
                height: 18.h,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _productName(BuildContext context) {
    return Text(
      product.productName,
      style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14.sp),
    );
  }

  Widget _productPrice(BuildContext context) {
    return Text(
      "\$${product.price.toString()}",
      style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14.sp),
    );
  }
}
