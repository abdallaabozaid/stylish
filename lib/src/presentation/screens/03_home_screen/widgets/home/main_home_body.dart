import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/widgets/home/header.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/widgets/new_arrivals/product_items.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/widgets/home/search_bar.dart';

import '../categories/categories_builder.dart';
import 'home_app_bar.dart';

class MainHomeBody extends StatelessWidget {
  const MainHomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeAppBar(fromHomeScreen: true),
          const HomeHeader(),
          SearchTextField(fromHomeScreen: true),
          Categories(),
          SizedBox(height: 40.h),
          const ProductItems.featured(),
          SizedBox(height: 30.h),
          const ProductItems.newArrivals(),
          SizedBox(height: 30.h),
          const ProductItems.topTrending(),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
