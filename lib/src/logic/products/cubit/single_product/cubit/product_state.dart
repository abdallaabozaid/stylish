part of 'product_cubit.dart';

class ProductState extends Equatable {
  const ProductState(
    this.product,
  );
  final ProductModel product;
  @override
  List<Object> get props =>
      [product, product, product.selectedColor, product.selectedImage];
}

class SelectColorState extends ProductState {
  const SelectColorState(ProductModel product) : super(product);

  @override
  List<Object> get props =>
      [product, product.selectedColor, product.selectedImage];
}
