import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/widgets/search_results/search_result_item.dart';

import '../../../../../data/model/product_model.dart';

class SearchResultsBuilder extends StatelessWidget {
  const SearchResultsBuilder({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(20.w),
        itemBuilder: (BuildContext context, int index) {
          // return SearchResultItem(product: products[index]);
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(seconds: 1),
            columnCount: 2,
            child: SlideAnimation(
              child: FadeInAnimation(
                child: SearchResultItem(product: products[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
