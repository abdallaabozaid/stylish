import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish/src/data/model/product_model.dart';
import 'package:stylish/src/data/repo/dummy_data_repo.dart';
import 'package:stylish/src/logic/categories/cubit/categories_cubit.dart';

import '../../../../../../config/enums.dart';
import 'product_items_builder.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({
    Key? key,
    required this.title,
    required this.sectionName,
  }) : super(key: key);

  // final List<ProductModel> products = DummyDataRepo.topTrending;
  final String title;
  final SectionName sectionName;

  const ProductItems.topTrending({
    Key? key,
    this.sectionName = SectionName.topTrending,
    this.title = 'Top Trending',
  }) : super(key: key);

  const ProductItems.featured({
    Key? key,
    this.sectionName = SectionName.newArrivals,
    this.title = 'Featured Products',
  }) : super(key: key);

  const ProductItems.newArrivals({
    Key? key,
    this.sectionName = SectionName.featured,
    this.title = 'New Arrivals',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = DummyDataRepo.topTrending;

    if (sectionName == SectionName.topTrending) {
      products = DummyDataRepo.topTrending;
    } else if (sectionName == SectionName.featured) {
      products = DummyDataRepo.featuredProducts;
    } else {
      products = DummyDataRepo.newArrivals;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 20.sp,
                ),
          ),
        ),
        SizedBox(
          height: 17.h,
        ),
        BlocBuilder<CategoriesCubit, SelectedCategoryState>(
          builder: (context, state) {
            final CategoryName categoryName = state.categoryName;
            return ProductItemsBuilder(
              products: _filterProductByCategory(
                  categoryName: categoryName, products: products),
            );
          },
        ),
      ],
    );
  }

  List<ProductModel> _filterProductByCategory(
      {required List<ProductModel> products,
      required CategoryName categoryName}) {
    return products
        .where((element) => element.categoryName == categoryName)
        .toList();
  }
}
