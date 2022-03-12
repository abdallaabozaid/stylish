import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:stylish/config/enums.dart';

class ProductModel extends Equatable {
  final CategoryName categoryName;
  final String productName;

  final String id;
  final int price;
  final String description;
  String selectedImage;
  Color selectedColor;

  final Map<Color, String> colorImage;
  final Color backGroundColor;

  // final List<Color> colors;
  bool isFavorite;
  ProductModel({
    required this.categoryName,
    required this.productName,
    required this.id,
    required this.price,
    required this.description,
    required this.selectedImage,
    required this.selectedColor,
    required this.colorImage,
    required this.backGroundColor,
    this.isFavorite = false,
  });

  @override
  List<Object> get props {
    return [
      categoryName,
      productName,
      id,
      price,
      description,
      selectedImage,
      selectedColor,
      colorImage,
      backGroundColor,
      isFavorite,
    ];
  }

  ProductModel copyWith({
    CategoryName? categoryName,
    String? productName,
    String? id,
    int? price,
    String? description,
    String? selectedImage,
    Color? selectedColor,
    Map<Color, String>? colorImage,
    Color? backGroundColor,
    bool? isFavorite,
  }) {
    return ProductModel(
      categoryName: categoryName ?? this.categoryName,
      productName: productName ?? this.productName,
      id: id ?? this.id,
      price: price ?? this.price,
      description: description ?? this.description,
      selectedImage: selectedImage ?? this.selectedImage,
      selectedColor: selectedColor ?? this.selectedColor,
      colorImage: colorImage ?? this.colorImage,
      backGroundColor: backGroundColor ?? this.backGroundColor,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
