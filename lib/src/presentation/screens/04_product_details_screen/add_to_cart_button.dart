import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish/src/data/model/product_model.dart';
import 'package:stylish/src/logic/products/cubit/single_product/cubit/product_cubit.dart';

import '../../../logic/user_info/user_info_cubit/user_info_cubit.dart';

// ignore: must_be_immutable
class AddToCartButton extends StatelessWidget {
  AddToCartButton({
    Key? key,
    // required this.product,
  }) : super(key: key);

  late ProductModel product;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        product = BlocProvider.of<ProductCubit>(context).product;

        return SizedBox(
          width: 205.w,
          height: 60.h,
          child: BlocBuilder<UserInfoCubit, UserInfoState>(
            builder: (context, state) {
              return ElevatedButton(
                child: Text(
                  'Add To Cart',
                  style: themeData.textTheme.headline3!
                      .copyWith(color: themeData.colorScheme.onPrimary),
                ),
                onPressed: () async {
                  BlocProvider.of<UserInfoCubit>(context).addToCart(
                    prductTitle: product.productName,
                    productId: product.id,
                    image: product.selectedImage,
                    price: product.price,
                    selectedColor: product.selectedColor,
                  );

                  ScaffoldMessenger.of(context).clearSnackBars();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Added to cart"),
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
