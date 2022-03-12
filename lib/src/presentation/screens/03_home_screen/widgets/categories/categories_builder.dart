import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/src/data/model/category_model.dart';
import 'package:stylish/src/logic/categories/cubit/categories_cubit.dart';

import '../../../../../data/repo/dummy_data_repo.dart';
import 'category_item.dart';

class Categories extends StatelessWidget {
  Categories({
    Key? key,
  }) : super(key: key);

  final List<CategoryModel> categories = DummyDataRepo.categoties;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _categories(context),
      ),
    );
  }

  List<Widget> _categories(BuildContext context) {
    return categories.map((e) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 9.w),
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            BlocProvider.of<CategoriesCubit>(context)
                .changeCategory(e.category);
          },
          child: CategoryItem(
            category: e,
          ),
        ),
      );
    }).toList();
  }
}
