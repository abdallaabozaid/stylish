import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:stylish/src/data/model/product_model.dart';

import 'product_item.dart';

class ProductItemsBuilder extends StatelessWidget {
  const ProductItemsBuilder({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: AnimationLimiter(
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            width: 9.w,
          ),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: products.length,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  duration: const Duration(seconds: 2),
                  child: ProductItem(product: products[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
