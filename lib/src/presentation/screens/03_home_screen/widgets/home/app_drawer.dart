import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:stylish/config/const.dart';
import 'package:stylish/config/theme/app_theme.dart';
import 'package:stylish/src/data/model/user_model.dart';
import 'package:stylish/src/logic/theme/bloc/theme_bloc.dart';
import 'package:stylish/src/logic/user_info/user_info_cubit/user_info_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppThemeClass.changeNavBarColor(context, false);
    final double notiBarHight = MediaQuery.of(context).padding.top;
    final ThemeData themeData = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        if (ZoomDrawer.of(context)!.isOpen()) {
          ZoomDrawer.of(context)!.close();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 20.w, vertical: notiBarHight + 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context, themeData),
              _drawerOptions(context, themeData),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context, ThemeData themeData) {
    final UserModel user = BlocProvider.of<UserInfoCubit>(context).userModel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerProfileImage(user.profileImage),
        _headerUserInfo(user, themeData),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  Widget _headerProfileImage(String profileImage) {
    return CircleAvatar(
      backgroundImage: AssetImage(profileImage),
      radius: 50.r,
    );
  }

  Widget _headerUserInfo(UserModel user, ThemeData themeData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 14.h,
        ),
        Text(
          user.userName,
          style: themeData.textTheme.headline1!.copyWith(
            fontSize: 18.sp,
          ),
        ),
        Text(
          user.email,
          style: themeData.textTheme.headline2!.copyWith(
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  Widget _drawerOptions(BuildContext context, ThemeData themeData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _drawerOption(
          context,
          themeData,
          title: 'Home',
          iconAsset: homeIcon,
          onPressed: () {},
        ),
        SizedBox(
          height: 29.h,
        ),
        _drawerOption(
          context,
          themeData,
          title: 'My Cart',
          iconAsset: bagIcon,
          onPressed: () {},
        ),
        SizedBox(
          height: 29.h,
        ),
        _drawerOption(
          context,
          themeData,
          title: 'Wallet',
          iconAsset: walletIcon,
          onPressed: () {},
        ),
        SizedBox(
          height: 29.h,
        ),
        _drawerOption(
          context,
          themeData,
          title: 'Privacy',
          iconAsset: lockIcon,
          onPressed: () {},
        ),
        SizedBox(
          height: 29.h,
        ),
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return _drawerOption(
              context,
              themeData,
              title: state.themeData == AppThemeClass.appDarkTheme
                  ? 'Light Theme'
                  : 'Dark Theme',
              iconAsset: documentIcon,
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(
                  ChangeTheme(),
                );
              },
            );
          },
        ),
        SizedBox(
          height: 29.h,
        ),
        _drawerOption(
          context,
          themeData,
          title: 'Settings',
          iconAsset: settingIcon,
          onPressed: () {},
        ),
        SizedBox(
          height: 70.h,
        ),
        _drawerOption(
          context,
          themeData,
          title: 'Logout',
          iconAsset: logoutIcon,
          onPressed: () {},
        ),
        SizedBox(
          height: 70.h,
        ),
        _logo(),
      ],
    );
  }

  Widget _drawerOption(
    BuildContext context,
    ThemeData themeData, {
    required String title,
    required String iconAsset,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.center,
            width: 28.w,
            height: 25.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: themeData.colorScheme.primary.withOpacity(0.2),
            ),
            child: Image.asset(
              iconAsset,
              width: 15.w,
              height: 15.h,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: themeData.textTheme.headline1!.copyWith(fontSize: 14.sp),
          )
        ],
      ),
    );
  }

  Widget _logo() {
    return Image.asset(
      logo,
      width: 52.w,
      height: 60.h,
    );
  }
}
