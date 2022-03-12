part of 'user_info_cubit.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

class UserInfoInitial extends UserInfoState {
  final UserModel? userModel;
  const UserInfoInitial({
    this.userModel,
  });
}

class UserEdited extends UserInfoState {
  UserEdited({required this.user}) {
    // UserPreferences.saveLocalUserModel(user);
  }

  final UserModel user;
}

class UserFavoritesEdited extends UserInfoState {
  UserFavoritesEdited({required this.isFavorite}) {
    // UserPreferences.saveLocalUserModel(user);
  }

  final bool isFavorite;

  @override
  List<Object> get props => [isFavorite];
}

class UserCartItemsChange extends UserInfoState {
  final Map<String, CartItem> cartItems;
  const UserCartItemsChange({
    required this.cartItems,
  });
  @override
  List<Object> get props =>
      [cartItems, cartItems.entries, cartItems.length, cartItems.isEmpty];
}

class UserCartItemsEmpty extends UserInfoState {}

class UserSingleCartItemChange extends UserInfoState {
  final CartItem cartItem;
  const UserSingleCartItemChange({
    required this.cartItem,
  });
  @override
  List<Object> get props => [cartItem.qnty];
}

class UserEmptyCartItems extends UserInfoState {
  const UserEmptyCartItems();
}
