import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCards extends StatelessWidget {
  const InfoCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h, right: 20.w, left: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _infoCard(
            context,
            title: 'Progress order',
            assetIcon: 'bag',
            value: 10,
            color: const Color(0xffF67952).withOpacity(0.2),
          ),
          _infoCard(
            context,
            title: 'Promocodes',
            assetIcon: 'ticket',
            value: 4,
            color: Colors.blue.withOpacity(0.2),
          ),
          _infoCard(
            context,
            title: 'Reviewes',
            assetIcon: 'star',
            value: 231,
            color: Colors.yellow.withOpacity(0.2),
          )
        ],
      ),
    );
  }

  Widget _infoCard(BuildContext context,
      {required String title,
      required String assetIcon,
      required int value,
      required Color color}) {
    return Card(
      elevation: 70,
      margin: const EdgeInsets.all(0),
      shadowColor: Colors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: SizedBox(
        height: 122.h,
        width: 106.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(color: color, assetIcon: assetIcon),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              value.toString(),
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }

  Widget _icon({required Color color, required String assetIcon}) {
    return Container(
      alignment: Alignment.center,
      width: 45.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        'assets/images/profile/$assetIcon.png',
        width: 24.w,
        height: 24.h,
      ),
    );
  }
}
