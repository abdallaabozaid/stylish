import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class CartItem extends Equatable {
  final String id;
  final String prductTitle;
  final String image;
  final int qnty;
  final int price;
  final Color color;
  const CartItem({
    required this.id,
    required this.prductTitle,
    required this.image,
    required this.qnty,
    required this.price,
    required this.color,
  });

  @override
  List<Object> get props {
    return [
      id,
      prductTitle,
      image,
      qnty,
      price,
      color,
    ];
  }

  CartItem copyWith({
    String? id,
    String? prductTitle,
    String? image,
    int? qnty,
    int? price,
    Color? color,
  }) {
    return CartItem(
      id: id ?? this.id,
      prductTitle: prductTitle ?? this.prductTitle,
      image: image ?? this.image,
      qnty: qnty ?? this.qnty,
      price: price ?? this.price,
      color: color ?? this.color,
    );
  }
}
