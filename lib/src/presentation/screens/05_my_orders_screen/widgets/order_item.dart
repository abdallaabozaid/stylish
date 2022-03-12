import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../data/model/order_model.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);

  final Order order;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      width: 333.w,
      height: 100.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: themeData.colorScheme.onPrimary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _orderImage(order),
          SizedBox(
            width: 20.w,
          ),
          _middleInfo(themeData, order),
          const Spacer(),
          _dateInfo(themeData, order),
        ],
      ),
    );
  }

  Widget _orderImage(Order order) {
    return Container(
      width: 85.w,
      height: 75.h,
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: order.items[0].color.withOpacity(0.2),
      ),
      child: Image.asset(order.items[0].image),
    );
  }

  Widget _middleInfo(ThemeData themeData, Order order) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Items :  ${order.items.length.toString()}",
          style: themeData.textTheme.headline2!.copyWith(fontSize: 15.sp),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          "\$${order.totalPrice.toString()}",
          style: themeData.textTheme.headline1!.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _dateInfo(ThemeData themeData, Order order) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('h:mm a').format(order.orderDate).toString(),
          style: themeData.textTheme.headline2!.copyWith(fontSize: 12.sp),
        ),
        Text(
          DateFormat('EEEE').format(order.orderDate).toString(),
          style: themeData.textTheme.headline1!.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          DateFormat('d MMM').format(order.orderDate).toString(),
          style: themeData.textTheme.headline2!.copyWith(fontSize: 12.sp),
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}
