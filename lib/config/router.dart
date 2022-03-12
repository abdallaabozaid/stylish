import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/config/const.dart';
import 'package:stylish/src/data/model/adress_model.dart';
import 'package:stylish/src/data/model/product_model.dart';
import 'package:stylish/src/logic/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';
import 'package:stylish/src/logic/categories/cubit/categories_cubit.dart';
import 'package:stylish/src/logic/products/cubit/single_product/cubit/product_cubit.dart';
import 'package:stylish/src/logic/user_info/adress/cubit/adress_cubit.dart';
import 'package:stylish/src/presentation/screens/01_on_boarding_screen/on_boarding_screen.dart';
import 'package:stylish/src/presentation/screens/02_log_in_screen/login_screen.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/home_screen.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/main_home_scree.dart';
import 'package:stylish/src/presentation/screens/04_product_details_screen/product_details_screen.dart';
import 'package:stylish/src/presentation/screens/10_checkout_screen/checkout_screen.dart';
import 'package:stylish/src/presentation/screens/11_payment_screen/payment_screen.dart';

import '../src/logic/user_info/user_info_cubit/user_info_cubit.dart';
import '../src/presentation/screens/08_search_screen/search_screen.dart';
import '../src/presentation/screens/09_cart_screen/cart_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case mainHomeScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<BottomNavigationCubit>(
                create: (context) => BottomNavigationCubit(),
              ),
              BlocProvider<CategoriesCubit>(
                create: (context) => CategoriesCubit(),
              ),
            ],
            child: const MainHomeScreen(),
          ),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case productDetailsScreen:
        final ProductModel product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ProductCubit(product),
            child: ProductDetailsScreen(product: product),
          ),
        );
      case cartScreen:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );
      case searchScreen:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case checkoutScreen:
        return MaterialPageRoute(builder: (context) {
          final Map<String, AdressModel> adress =
              BlocProvider.of<UserInfoCubit>(context).userModel.deliveryAdress;
          return BlocProvider(
            create: (context) => AdressCubit(adress),
            child: const CheckoutScreen(),
          );
        });
      case paymentScreen:
        return MaterialPageRoute(
          builder: (context) => const PaymentScreen(),
        );
    }
    return null;
  }
}
