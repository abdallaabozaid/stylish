import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish/src/data/model/category_model.dart';
import 'package:stylish/src/logic/categories/cubit/categories_cubit.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    bool selected = false;
    return BlocBuilder<CategoriesCubit, SelectedCategoryState>(
      builder: (context, state) {
        selected = category.category == state.categoryName;
        return Container(
          width: 71.w,
          height: 75.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: selected
                ? Theme.of(context).colorScheme.primaryContainer
                : Colors.transparent,
            border: Border.all(color: Colors.white70),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                category.categoryImageAsset,
                width: 34.w,
                height: 40.h,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                category.categoryName,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 12.sp),
              )
            ],
          ),
        );
      },
    );
  }
}
