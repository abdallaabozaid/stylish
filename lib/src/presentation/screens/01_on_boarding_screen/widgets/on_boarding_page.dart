import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish/config/const.dart';
import 'package:stylish/src/presentation/common_widgets/app_common_commands.dart';
import 'package:stylish/src/presentation/screens/01_on_boarding_screen/widgets/body.dart';
import 'package:stylish/src/presentation/screens/01_on_boarding_screen/widgets/header.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.index,
    required this.pageController,
  }) : super(key: key);
  final int index;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                OnBoardingHeader(index: index),
                OnBoardingBody(index: index),
                _nextButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _nextButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        index == 2
            ? AppCommonCommands.goToAndReplace(context, loginScreen)
            : pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceIn,
              );
      },
      child: SizedBox(
        width: 218.w,
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buttonText(context),
            _buttonIcons(),
          ],
        ),
      ),
    );
  }

  Widget _buttonText(BuildContext context) {
    return TextButton(
      onPressed: null,
      child: Text(
        index == 2 ? 'Get Started' : 'Next',
        style: Theme.of(context).textTheme.headline3!.copyWith(),
      ),
    );
  }

  Widget _buttonIcons() {
    final Widget icon = Image.asset(
      'assets/icons/next${index + 1}.png',
      width: index == 1
          ? 30
          : index == 2
              ? 36
              : 22.w,
      height: 22.h,
    );
    return icon;
  }
}
