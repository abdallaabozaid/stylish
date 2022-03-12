import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/home_screen.dart';
import 'package:stylish/src/presentation/screens/03_home_screen/widgets/home/app_drawer.dart';

import '../../../../config/theme/app_theme.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppThemeClass.changeNavBarColor(context, true);

    return ZoomDrawer(
      mainScreen: HomeScreen(),
      menuScreen: const AppDrawer(),
      angle: 0,
      borderRadius: 25.r,
      mainScreenScale: 0.15,
      slideWidth: 188.w,
      showShadow: true,
      shadowLayer1Color: Colors.black,
      mainScreenTapClose: true,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 40.r,
          spreadRadius: 1,
        ),
      ],
    );
  }
}
