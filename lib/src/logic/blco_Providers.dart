import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/src/logic/auth/cubit/auth_cubit.dart';
import 'package:stylish/src/logic/theme/bloc/theme_bloc.dart';

import '../data/model/search_filters_model.dart';
import 'orders/cubit/orders_cubit.dart';
import 'products/cubit/products_cubit.dart';
import 'search/search_filters/cubit/search_filters_cubit.dart';
import 'search/search_products/bloc/search_products_bloc.dart';
import 'user_info/user_info_cubit/user_info_cubit.dart';

class AppBlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
    ),
    BlocProvider<SearchFiltersCubit>(
      create: (context) =>
          SearchFiltersCubit(searchFiltersModel: SearchFiltersModel()),
    ),
    BlocProvider<SearchProductsBloc>(
      create: (context) => SearchProductsBloc([], ''),
    ),
    BlocProvider<UserInfoCubit>(
      create: (context) => UserInfoCubit(),
    ),
    BlocProvider<ProductsCubit>(
      create: (context) => ProductsCubit(),
    ),
    BlocProvider<AuthCubit>(create: (context) {
      return AuthCubit();
    }),
    BlocProvider<OrdersCubit>(
      create: (context) => OrdersCubit(),
    )
  ];
}
