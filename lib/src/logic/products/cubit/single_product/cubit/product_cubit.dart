import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stylish/src/data/model/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
    this.product,
  ) : super(ProductState(product)) {
    selectedImage = product.selectedImage;
    selectedColor = product.selectedColor;
  }
  // : super(ProductState(product));

  ProductModel product;
  late Color selectedColor;
  late String selectedImage;

  void _editProduct({Color? color}) {
    product = product.copyWith(
        selectedColor: color, selectedImage: product.colorImage[color]!);
  }

  void selectColor(Color color) {
    selectedColor = color;
    selectedImage = product.colorImage[color]!;
    // product.selectedColor = color;
    // product.selectedImage = product.colorImage[color]!;
    _editProduct(color: color);
    emit(SelectColorState(product));
  }
}
