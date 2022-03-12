import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish/src/logic/search/search_filters/cubit/search_filters_cubit.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/widgets/bottom_filter/price_rang_fIlter.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/widgets/bottom_filter/section_filter.dart';

import 'distance_range_filter.dart';

class BottomFilter extends StatelessWidget {
  const BottomFilter({
    Key? key,
    required this.searchFiltersCubit,
  }) : super(key: key);

  final SearchFiltersCubit searchFiltersCubit;
  @override
  @override
  Widget build(BuildContext context) {
    ThemeData colorTheme = Theme.of(context);
    return Container(
      height: 605.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorTheme.colorScheme.onPrimary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
            child: _header(context, colorTheme),
          ),
          const Divider(
            thickness: 2,
            height: 1,
          ),
          SizedBox(
            height: 28.h,
          ),
          SectionFilter(),
          SizedBox(
            height: 28.h,
          ),
          const PriceRangFIlter(),
          const DistanceRangeFilter(),
          SizedBox(
            height: 40.h,
          ),
          _applyButton(context, colorTheme)
        ],
      ),
    );
  }

  Widget _header(BuildContext context, ThemeData colorTheme) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textButton(
                label: 'reset',
                onPressed: () {
                  searchFiltersCubit.resetFilters();
                },
                colorTheme: colorTheme),
            Text(
              'Filters',
              style: colorTheme.textTheme.headline1!.copyWith(fontSize: 20),
            ),
            _textButton(
                label: 'close',
                onPressed: () => _closeBottomFilters(context),
                colorTheme: colorTheme),
          ],
        ),
      ],
    );
  }

  Widget _textButton(
      {required String label,
      required VoidCallback onPressed,
      required ThemeData colorTheme}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: colorTheme.textTheme.headline2!.copyWith(fontSize: 14),
      ),
    );
  }

  void _closeBottomFilters(BuildContext context) {
    Navigator.pop(context, true);
  }

  Widget _applyButton(BuildContext context, ThemeData colorTheme) {
    return SizedBox(
      height: 55.h,
      width: 256.w,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context, false);
        },
        child: Text(
          'Apply Filter',
          style: colorTheme.textTheme.headline3!.copyWith(fontSize: 16.sp),
        ),
      ),
    );
  }
}
