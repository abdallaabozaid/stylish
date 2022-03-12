import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _title(context),
          SizedBox(
            height: 20.h,
          ),
          _infoBox(context),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      "Personal Information",
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 15),
    );
  }

  Widget _infoBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: 195.w,
      height: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(width: 1.w, color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _infoRow(context, key: 'Name', value: 'Abdulla Mohamed'),
          _infoRow(context, key: 'Email', value: 'Abdallaaboaid211@gmail.com'),
          _infoRow(context, key: 'Location', value: 'Cairo , Egypt'),
          _infoRow(context, key: 'Zip Code', value: '23678'),
          _infoRow(context, key: 'Phone Number', value: '+(20) 1067782076)'),
        ],
      ),
    );
  }

  Widget _infoRow(BuildContext context,
      {required String key, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$key : ',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontSize: 14.sp),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
          )
        ],
      ),
    );
  }
}
