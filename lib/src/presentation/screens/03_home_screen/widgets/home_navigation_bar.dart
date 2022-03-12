import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/config/const.dart';
import 'package:stylish/src/logic/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return CurvedNavigationBar(
          index: state.index,
          color: Theme.of(context).colorScheme.secondary,
          height: 85.h,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Theme.of(context).colorScheme.primary,
          items: _navigationIcon(),
          onTap: (index) {
            BlocProvider.of<BottomNavigationCubit>(context).navigatoTo(index);
          },
        );
      },
    );
  }

  List<Widget> _navigationIcon() {
    return List.generate(
      navBarIcons.length,
      (index) => Image.asset(
        navBarIcons[index],
        width: 20.w,
        height: 20.h,
      ),
    );
  }
}
