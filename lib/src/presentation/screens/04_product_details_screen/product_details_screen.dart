import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish/src/data/model/product_model.dart';
import 'package:stylish/src/logic/products/cubit/single_product/cubit/product_cubit.dart';
import 'package:stylish/src/presentation/screens/04_product_details_screen/widgets/colors_builder.dart';

import '../../../logic/user_info/user_info_cubit/user_info_cubit.dart';
import 'add_to_cart_button.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  ProductModel product;
  late List<Color> colorList;
  @override
  Widget build(BuildContext context) {
    product = BlocProvider.of<ProductCubit>(context).product;
    final Size size = MediaQuery.of(context).size;
    colorList = product.colorImage.keys.toList();

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).removeCurrentSnackBar();

          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              _upper(context, size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _upper(BuildContext context, Size size) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: product.backGroundColor,
          width: 375.w,
          height: size.height,
        ),
        _productImage(colorList[0]),
        _appBar(context),
        _lower(context, size),
      ],
    );
  }

  Widget _lower(BuildContext context, Size size) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width,
        height: 360.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(45.r),
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10, top: 30.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.productName,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 20),
                  ),
                  Text(
                    "\$${product.price.toString()}",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                product.description,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14),
              ),
              SizedBox(
                height: 18.h,
              ),
              _colorSection(context),
              SizedBox(
                height: 20.h,
              ),
              AddToCartButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productImage(Color firstColor) {
    Color selectedColor = firstColor;

    return Positioned(
      top: 70.h,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is SelectColorState) {
            selectedColor = state.product.selectedColor;
          }
          return Image.asset(
            product.colorImage[selectedColor]!,
            width: 272.w,
            height: 363.h,
          );
        },
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Positioned(
      top: 60.h,
      left: 0.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SizedBox(
          width: MediaQuery.of(context).size.width.w - 35.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/icons/back.png',
                  width: 25.w,
                  height: 25.h,
                ),
              ),
              _favoriteIcon(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _favoriteIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<UserInfoCubit>(context).favStatusChange(product);
        product.isFavorite = !product.isFavorite;
      },
      child: Container(
        width: 50.w,
        height: 50.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: BlocBuilder<UserInfoCubit, UserInfoState>(
          builder: (context, state) {
            return Image.asset(
              product.isFavorite
                  ? 'assets/icons/favorite_details.png'
                  : 'assets/icons/unfavorite.png',
              width: 28.w,
              height: 28.h,
            );
          },
        ),
      ),
    );
  }

  Widget _colorSection(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Colors',
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 18),
          ),
          SizedBox(
            height: 14.h,
          ),
          ColorsBuilder(colors: colorList),
        ],
      ),
    );
  }
}
