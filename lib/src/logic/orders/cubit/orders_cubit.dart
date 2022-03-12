import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylish/src/data/model/order_model.dart';

import '../../../data/model/cart_item_model.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(const OrdersState([]));

  List<Order> orders = [];

  void addOrder(List<CartItem> cartItems, int totalPrice) {
    Order order = Order(
        items: cartItems, orderDate: DateTime.now(), totalPrice: totalPrice);
    orders.add(order);
    emit(state.copyWith(orders: orders));
  }
}
