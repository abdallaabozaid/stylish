part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductColorImageChange extends ProductsState {
  final Color color;
  const ProductColorImageChange({
    required this.color,
  });

  @override
  List<Object> get props => [color];
}
