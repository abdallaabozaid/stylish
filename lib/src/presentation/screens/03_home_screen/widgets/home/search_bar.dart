import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/config/const.dart';

import '../../../../../data/model/search_filters_model.dart';
import '../../../../../logic/search/search_filters/cubit/search_filters_cubit.dart';
import '../../../../../logic/search/search_products/bloc/search_products_bloc.dart';
import '../bottom_filter/bottom_filter.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    Key? key,
    required this.fromHomeScreen,
  }) : super(key: key);
  final bool fromHomeScreen;
  String searchWord = '';
  @override
  Widget build(BuildContext context) {
    final SearchFiltersCubit searchFiltersCubit =
        BlocProvider.of<SearchFiltersCubit>(context);
    return Hero(
      tag: 'search',
      child: Material(
        color: Colors.transparent,
        // type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: TextFormField(
            readOnly: fromHomeScreen ? true : false,
            onTap: (() {
              if (fromHomeScreen) {
                Navigator.pushNamed(context, searchScreen);
              } else {
                return;
              }
            }),
            autofocus: fromHomeScreen ? false : true,
            decoration: InputDecoration(
              label: const Text('Search items...'),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixIconConstraints: const BoxConstraints(),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: _filterIcon(context, searchFiltersCubit),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              prefixIconConstraints: const BoxConstraints(),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 8.w, left: 20.w),
                child: Image.asset(
                  searchIcon,
                  width: 15.w,
                  height: 15.h,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 0, color: Colors.transparent),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.primaryContainer,
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (searchWord) {
              this.searchWord = searchWord;
              _search(
                context,
                searchWord,
                searchFiltersCubit.searchFiltersModel,
              );
            },
          ),
        ),
      ),
    );
  }

  void _search(BuildContext context, String searchWord,
      SearchFiltersModel searchFilters) {
    BlocProvider.of<SearchProductsBloc>(context)
        .add(Search(searchWord: searchWord, searchFilters: searchFilters));
  }

  _filterIcon(
      BuildContext filterIconContext, SearchFiltersCubit searchFiltersCubit) {
    return InkWell(
      onTap: () {
        _showModalSheet(filterIconContext, searchFiltersCubit);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 47.w,
            height: 43.h,
            decoration: BoxDecoration(
                color: Theme.of(filterIconContext).colorScheme.primary,
                borderRadius: BorderRadius.circular(10.r)),
          ),
          Image.asset(
            filterIcon,
            width: 18.w,
            height: 18.h,
          )
        ],
      ),
    );
  }

  void _showModalSheet(
      BuildContext ctx, SearchFiltersCubit searchFiltersCubit) async {
    bool? _dismissed = await showModalBottomSheet<bool>(
      context: ctx,
      backgroundColor: Colors.transparent,
      builder: (BuildContext ctxx) {
        return Builder(builder: (ctx) {
          return Center(
            child: BottomFilter(
              searchFiltersCubit: searchFiltersCubit,
            ),
          );
        });
      },
    );

    if (_dismissed == null || _dismissed) {
      BlocProvider.of<SearchFiltersCubit>(ctx).resetFilters();
    } else {
      _search(
        ctx,
        searchWord,
        searchFiltersCubit.searchFiltersModel,
      );
    }
  }
}
