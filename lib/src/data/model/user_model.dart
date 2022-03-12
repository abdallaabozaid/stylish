import 'package:stylish/src/data/model/adress_model.dart';
import 'package:stylish/src/data/model/cart_item_model.dart';
import 'package:stylish/src/data/model/product_model.dart';

class UserModel {
  String uId;
  String email;
  String userName;

  String profileImage;
  List<ProductModel>? favoriteProducts;
  Map<String, CartItem>? cartItems;
  Map<String, AdressModel> deliveryAdress;
  UserModel({
    required this.uId,
    required this.email,
    required this.userName,
    required this.profileImage,
    this.favoriteProducts,
    this.cartItems,
    required this.deliveryAdress,
  });

  UserModel copyWith({
    String? uId,
    String? email,
    String? userName,
    String? profileImage,
    List<ProductModel>? favoriteProducts,
    Map<String, CartItem>? cartItems,
    Map<String, AdressModel>? deliveryAdress,
  }) {
    return UserModel(
      uId: uId ?? this.uId,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      profileImage: profileImage ?? this.profileImage,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
      cartItems: cartItems ?? this.cartItems,
      deliveryAdress: deliveryAdress ?? this.deliveryAdress,
    );
  }

  // UserModel adressCopyWith({
  //   AdressModel? homeAdress,
  //   AdressModel? officeAdress,
  // }) {
  //   return UserModel(
  //     uId: uId,
  //     email: email,
  //     favoriteProducts: favoriteProducts,
  //     cartItems: cartItems,
  //     deliveryAdress: {
  //       'home': homeAdress!,
  //       if (officeAdress != null) 'office': officeAdress,
  //     },
  //   );
  // }
}
