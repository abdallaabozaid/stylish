import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../logic/search/search_filters/cubit/search_filters_cubit.dart';

class DistanceRangeFilter extends StatelessWidget {
  const DistanceRangeFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SearchFiltersModel searchFilters;
    final searchFiltersCubit = BlocProvider.of<SearchFiltersCubit>(context);
    final ThemeData colorTheme = Theme.of(context);

    return BlocBuilder<SearchFiltersCubit, SearchFiltersState>(
      buildWhen: (previous, current) =>
          current.searchFiltersModel.distanceRanegValue !=
          previous.searchFiltersModel.distanceRanegValue,
      builder: (context, state) {
        RangeValues _rangeSliderDiscreteValues =
            state.searchFiltersModel.distanceRanegValue;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Distance',
                    style:
                        colorTheme.textTheme.headline1!.copyWith(fontSize: 20),
                  ),
                  Text(
                    "${_rangeSliderDiscreteValues.start.toInt()}km : ${_rangeSliderDiscreteValues.end.toInt()}km",
                    style:
                        colorTheme.textTheme.headline1!.copyWith(fontSize: 14),
                  ),
                ],
              ),
              RangeSlider(
                values: _rangeSliderDiscreteValues,
                min: 1,
                max: 50,
                divisions: 50,
                labels: RangeLabels(
                  _rangeSliderDiscreteValues.start.round().toString(),
                  _rangeSliderDiscreteValues.end.round().toString(),
                ),
                onChanged: (values) {
                  searchFiltersCubit.changeSearchFilters(
                      distanceRangeValues: values);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
