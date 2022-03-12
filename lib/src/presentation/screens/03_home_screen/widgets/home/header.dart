import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 32.sp,
                ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'best Outfits for you',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 16.sp,
                ),
          ),
        ],
      ),
    );
  }
}
