import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish/src/data/model/product_model.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/widgets/search_results/search_results_buider.dart';

class FavoriteItemsViewer extends StatelessWidget {
  const FavoriteItemsViewer({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return noResultsFound(context);
    } else {
      return Padding(
        padding: EdgeInsets.only(bottom: 60.h),
        child: Column(
          children: [
            SearchResultsBuilder(products: products),
          ],
        ),
      );
    }
  }

  Widget noResultsFound(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.w),
      child: Center(
        child: Text(
          'No favorites yet',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }
}
