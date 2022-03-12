import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:stylish/config/theme/app_theme.dart';
import 'package:stylish/src/logic/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';
import 'package:stylish/src/presentation/common_widgets/app_common_commands.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/widgets/home/main_home_body.dart';

import '../05_my_orders_screen/my_orders_screen.dart';
import '../06_favorites_screen/favorites_screen.dart';
import '../07_profile_screen/profile_screen.dart';
import 'widgets/home_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Widget> _navigationPages = [
    const MainHomeBody(),
    const MyOrdersScreen(),
    FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    int index = 0;
    AppThemeClass.changeNavBarColor(context, true);
    return BlocListener<BottomNavigationCubit, BottomNavigationState>(
      listener: (context, state) {
        index = state.index;
      },
      child: WillPopScope(
        onWillPop: () async {
          if (index != 0) {
            _navigateTo(context, 0);

            return false;
          } else {
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
              return false;
            } else {
              return _exitConfirmation(context);
            }
          }
        },
        child: Scaffold(
          extendBody: true,
          bottomNavigationBar: const HomeNavigationBar(),
          body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
            builder: (context, state) {
              return _navigationPages[state.index];
            },
          ),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, int index) {
    BlocProvider.of<BottomNavigationCubit>(context).navigatoTo(index);
  }

  Future<bool> _exitConfirmation(BuildContext context) async {
    bool _willExit = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Got Stylish Enough ?!'),
        actions: [
          TextButton(
            onPressed: () => AppCommonCommands.goBack(context, true),
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () => AppCommonCommands.goBack(context, false),
            child: const Text('No'),
          )
        ],
      ),
    );
    return _willExit;
  }
}
