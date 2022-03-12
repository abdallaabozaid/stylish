import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/src/logic/search/search_filters/cubit/search_filters_cubit.dart';

import '../../../../../data/model/search_filters_model.dart';

class PriceRangFIlter extends StatelessWidget {
  const PriceRangFIlter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchFiltersModel searchFilters;
    final searchFiltersCubit = BlocProvider.of<SearchFiltersCubit>(context);
    final ThemeData colorTheme = Theme.of(context);

    return BlocBuilder<SearchFiltersCubit, SearchFiltersState>(
      buildWhen: (previous, current) =>
          current.searchFiltersModel.priceRanegValue !=
          previous.searchFiltersModel.priceRanegValue,
      builder: ((context, state) {
        searchFilters = state.searchFiltersModel;

        RangeValues _rangeSliderDiscreteValues = searchFilters.priceRanegValue;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price',
                    style:
                        colorTheme.textTheme.headline1!.copyWith(fontSize: 20),
                  ),
                  Text(
                    "\$${_rangeSliderDiscreteValues.start.toInt()} : \$${_rangeSliderDiscreteValues.end.toInt()}",
                    style:
                        colorTheme.textTheme.headline1!.copyWith(fontSize: 14),
                  ),
                ],
              ),
              RangeSlider(
                values: searchFilters.priceRanegValue,
                min: 100,
                max: 800,
                divisions: 700,
                labels: RangeLabels(
                  _rangeSliderDiscreteValues.start.round().toString(),
                  _rangeSliderDiscreteValues.end.round().toString(),
                ),
                onChanged: (values) {
                  searchFiltersCubit.changeSearchFilters(
                      priceRangeValues: values);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
