import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish/src/data/model/search_filters_model.dart';

import '../../../../../../config/enums.dart';
import '../../../../../logic/search/search_filters/cubit/search_filters_cubit.dart';

class SectionFilter extends StatelessWidget {
  SectionFilter({
    Key? key,
  }) : super(key: key);

  final List<SectionName> sectionNames = [
    SectionName.newArrivals,
    SectionName.topTrending,
    SectionName.featured,
  ];

  @override
  Widget build(BuildContext context) {
    SearchFiltersModel searchFilters;
    final searchFiltersCubit = BlocProvider.of<SearchFiltersCubit>(context);

    final ThemeData colorTheme = Theme.of(context);

    return BlocBuilder<SearchFiltersCubit, SearchFiltersState>(
      buildWhen: (previous, current) =>
          current.searchFiltersModel.sectionName !=
          previous.searchFiltersModel.sectionName,
      builder: (sectionFilterCtx, state) {
        searchFilters = state.searchFiltersModel;

        final List<Widget> sections = sectionNames.map((e) {
          bool selected = searchFilters.sectionName == e;
          return InkWell(
            onTap: () {
              searchFiltersCubit.changeSearchFilters(sectionName: e);
            },
            child: Container(
              height: 40.h,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: selected
                    ? colorTheme.colorScheme.primary
                    : colorTheme.colorScheme.background,
              ),
              child: Text(
                e == SectionName.newArrivals
                    ? 'New Arrivals '
                    : e == SectionName.topTrending
                        ? 'Top Trending'
                        : 'Featured',
                style: colorTheme.textTheme.headline1!.copyWith(fontSize: 10),
              ),
            ),
          );
        }).toList();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: sections,
          ),
        );
      },
    );
  }
}
