import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/src/presentation/screens/05_my_orders_screen/widgets/canceled_orders.dart';
import 'package:stylish/src/presentation/screens/05_my_orders_screen/widgets/completed_orders.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _appBar(context, themeData),
        body: const TabBarView(
          children: [
            CompletedOrders(),
            CanceledOrders(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context, ThemeData themeData) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'My Orders',
        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20.sp),
      ),
      centerTitle: true,
      bottom: _tapBar(themeData),
    );
  }

  TabBar _tapBar(ThemeData themeData) {
    return TabBar(
      indicatorColor: themeData.colorScheme.primary,
      indicatorPadding: EdgeInsets.symmetric(horizontal: 20.w),
      indicatorWeight: 3,
      labelColor: themeData.colorScheme.primary,
      labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
      unselectedLabelColor: themeData.colorScheme.secondary.withOpacity(0.6),
      tabs: const [
        Tab(
          text: 'Completed',
        ),
        Tab(
          text: 'Canceled',
        ),
      ],
    );
  }
}
