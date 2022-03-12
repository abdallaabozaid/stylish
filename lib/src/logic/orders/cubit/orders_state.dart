// part of 'orders_cubit.dart';

// abstract class OrdersState extends Equatable {
//   const OrdersState();

//   @override
//   List<Object> get props => [];
// }

// class OrdersInitial extends OrdersState {}

part of 'orders_cubit.dart';

class OrdersState extends Equatable {
  const OrdersState(
    this.orders,
  );

  final List<Order> orders;

  @override
  List<Object> get props => [];

  OrdersState copyWith({
    List<Order>? orders,
  }) {
    return OrdersState(
      orders ?? this.orders,
    );
  }
}
