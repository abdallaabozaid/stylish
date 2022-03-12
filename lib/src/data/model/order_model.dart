import 'package:equatable/equatable.dart';

import 'package:stylish/src/data/model/cart_item_model.dart';

class Order extends Equatable {
  final List<CartItem> items;
  final DateTime orderDate;
  final int totalPrice;
  const Order({
    required this.items,
    required this.orderDate,
    required this.totalPrice,
  });

  @override
  List<Object> get props => [items, orderDate];

  Order copyWith({
    List<CartItem>? items,
    DateTime? orderDate,
    int? totalPrice,
  }) {
    return Order(
      items: items ?? this.items,
      orderDate: orderDate ?? this.orderDate,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
