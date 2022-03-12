import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/config/theme/app_theme.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/widgets/home/home_app_bar.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/widgets/home/search_bar.dart';

import '../../../data/model/product_model.dart';
import '../../../logic/search/search_products/bloc/search_products_bloc.dart';
import '../03_home_screen/widgets/search_results/search_results_viewer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppThemeClass.changeNavBarColor(context, false);

    List<ProductModel> searchResults = [];
    String searchWord = '';

    return WillPopScope(
      onWillPop: (() async {
        AppThemeClass.changeNavBarColor(context, true);
        return true;
      }),
      child: GestureDetector(
        onTap: () => _dismissKeyBoard(context),
        child: Scaffold(
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(children: [
              const HomeAppBar(fromHomeScreen: false),
              SearchTextField(fromHomeScreen: false),
              BlocBuilder<SearchProductsBloc, SearchProductsState>(
                builder: (context, state) {
                  searchResults = state.results;
                  searchWord = state.searchWord;
                  if (searchWord.isEmpty) {
                    return _startSearchText(context);
                  } else {
                    return SearchResultsViewer(
                      products: searchResults,
                      noItemsFoundText: 'No products found ..',
                    );
                  }
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _startSearchText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.w),
      child: Center(
        child: Text(
          'Start searching for clothes',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }

  void _dismissKeyBoard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
