import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish/src/data/model/product_model.dart';
import 'package:stylish/src/logic/search/search_products/bloc/search_products_bloc.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/widgets/search_results/search_results_buider.dart';

class SearchResultsViewer extends StatelessWidget {
  const SearchResultsViewer({
    Key? key,
    required this.products,
    required this.noItemsFoundText,
  }) : super(key: key);

  final List<ProductModel> products;
  final String noItemsFoundText;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return noResultsFound(context);
    } else {
      return Padding(
        padding: EdgeInsets.only(bottom: 60.h),
        child: Column(
          children: [
            _headerSearchText(context),
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
          noItemsFoundText,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }

  Widget _headerSearchText(BuildContext context) {
    return BlocBuilder<SearchProductsBloc, SearchProductsState>(
      builder: (context, state) {
        return Center(
            child: Text('Search results showing for “${state.searchWord}”'));
      },
    );
  }
}
