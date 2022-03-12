import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:stylish/src/data/model/adress_model.dart';
import 'package:stylish/src/data/model/cart_item_model.dart';
import 'package:stylish/src/data/model/product_model.dart';
import 'package:stylish/src/data/model/user_model.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(const UserInfoInitial());

  UserModel userModel = UserModel(
    uId: 'uId',
    email: 'Abdallaabozaid211@gmail.com',
    cartItems: {},
    favoriteProducts: [],
    deliveryAdress: {
      'home': AdressModel(
          city: 'Cairo',
          street: 'Mondy st',
          phoneNumber: 01067782075,
          zipCode: 12345,
          selected: true),
      'office': AdressModel(
        city: 'Alexandria',
        street: 'Rock st',
        phoneNumber: 01067782075,
        zipCode: 21344,
        selected: false,
      ),
    },
    profileImage: 'assets/images/profile/profile_pic.jpg',
    userName: 'Abdullah',
  );

  void _editUser({
    String? email,
    ProductModel? addFavoriteProduct,
    ProductModel? removeFavoriteProduct,
  }) {
    userModel.email = email ?? userModel.email;
    addFavoriteProduct == null
        ? null
        : userModel.favoriteProducts!.add(addFavoriteProduct);
    userModel.email = email ?? userModel.email;
    removeFavoriteProduct == null
        ? null
        : userModel.favoriteProducts!.remove(removeFavoriteProduct);
  }

  void favStatusChange(ProductModel product) {
    if (product.isFavorite) {
      _editUser(removeFavoriteProduct: product);
      emit(UserFavoritesEdited(isFavorite: false));
    } else {
      _editUser(addFavoriteProduct: product);
      emit(UserFavoritesEdited(isFavorite: true));
    }
    emit(UserEdited(user: userModel));
  }

  void removeSingleCartItem(String id) {
    if (!userModel.cartItems!.containsKey(id)) {
      return;
    } else if (userModel.cartItems![id]!.qnty > 1) {
      userModel.cartItems!.update(
        id,
        (exsistingCartItem) => CartItem(
          id: exsistingCartItem.id,
          price: exsistingCartItem.price,
          image: exsistingCartItem.image,
          prductTitle: exsistingCartItem.prductTitle,
          qnty: exsistingCartItem.qnty - 1,
          color: exsistingCartItem.color,
        ),
      );
    } else {
      return;
    }

    emit(
      UserSingleCartItemChange(cartItem: userModel.cartItems![id]!),
    );
  }

  void removeCartItem(String id) {
    if (userModel.cartItems!.length == 1) {
      emit(UserCartItemsEmpty());
      userModel.cartItems = {};
    } else {
      userModel.cartItems!.remove(id);
      if (userModel.cartItems!.isNotEmpty) {
        emit(UserCartItemsChange(cartItems: userModel.cartItems!));
      } else {
        emit(const UserEmptyCartItems());
      }
    }
  }

  void clearCart() {
    userModel.cartItems = {};
    emit(UserCartItemsEmpty());
  }

  void addToCart({
    required Color selectedColor,
    required String productId,
    required String prductTitle,
    required String image,
    required int price,
  }) {
    if (userModel.cartItems!.containsKey(productId)) {
      if (userModel.cartItems![productId]!.color == selectedColor) {
        userModel.cartItems!.update(
            productId,
            (existingItem) => CartItem(
                id: existingItem.id,
                prductTitle: existingItem.prductTitle,
                image: existingItem.image,
                qnty: existingItem.qnty + 1,
                price: existingItem.price,
                color: existingItem.color));
        emit(
          UserSingleCartItemChange(cartItem: userModel.cartItems![productId]!),
        );
      } else {
        if (userModel.cartItems!
            .containsKey(productId + selectedColor.toString())) {
          userModel.cartItems!.update(
              productId + selectedColor.toString(),
              (existingItem) => CartItem(
                  id: existingItem.id,
                  prductTitle: existingItem.prductTitle,
                  image: existingItem.image,
                  qnty: existingItem.qnty + 1,
                  price: existingItem.price,
                  color: existingItem.color));
          emit(
            UserSingleCartItemChange(
                cartItem: userModel.cartItems![productId]!),
          );
        } else {
          userModel.cartItems!.putIfAbsent(
            productId + selectedColor.toString(),
            () => CartItem(
              id: DateTime.now().toString(),
              prductTitle: prductTitle,
              qnty: 1,
              price: price,
              image: image,
              color: selectedColor,
            ),
          );

          emit(UserCartItemsChange(cartItems: userModel.cartItems!));
        }
      }
    } else {
      userModel.cartItems!.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          prductTitle: prductTitle,
          qnty: 1,
          price: price,
          image: image,
          color: selectedColor,
        ),
      );

      emit(UserCartItemsChange(cartItems: userModel.cartItems!));
    }
  }

  void selectedAdress(String adressKey) {
    if (adressKey == 'home') {
      userModel.deliveryAdress = {
        'home': userModel.deliveryAdress['home']!.copyWith(
          selected: true,
        ),
        'office': userModel.deliveryAdress['office']!.copyWith(
          selected: false,
        ),
      };
    } else {
      userModel.deliveryAdress = {
        'home': userModel.deliveryAdress['home']!.copyWith(
          selected: false,
        ),
        'office': userModel.deliveryAdress['office']!.copyWith(
          selected: true,
        ),
      };
    }

    emit(UserEdited(user: userModel));
  }

  int subTotalPrice() {
    List<CartItem> cartItems = userModel.cartItems!.values.toList();
    int subtotal = 0;
    for (var element in cartItems) {
      final int itemPrice = element.qnty * element.price;
      subtotal = subtotal + itemPrice;
    }
    return subtotal;
  }
}
