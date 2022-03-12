import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stylish/src/data/model/order_model.dart';
import 'package:stylish/src/logic/orders/cubit/orders_cubit.dart';
import 'package:stylish/src/presentation/screens/05_my_orders_screen/widgets/order_item.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Order> orders = BlocProvider.of<OrdersCubit>(context).orders;
    return SingleChildScrollView(
      // controller: controller,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: AnimationLimiter(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: SlideAnimation(
                      child: OrderItem(
                        order: orders[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
