import 'package:flutter/material.dart';
import 'package:stylish/config/const.dart';
import 'package:stylish/src/presentation/common_widgets/app_common_commands.dart';

class OnBoardingHeader extends StatelessWidget {
  const OnBoardingHeader({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _pageNumber(context),
        _skipText(context),
      ],
    );
  }

  Widget _pageNumber(BuildContext context) {
    return Row(
      children: [
        Text(
          (index + 1).toString(),
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          '/3',
          style: index == 2
              ? Theme.of(context).textTheme.headline4
              : Theme.of(context).textTheme.headline5,
        )
      ],
    );
  }

  Widget _skipText(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        AppCommonCommands.goToAndReplace(context, mainHomeScreen);
      },
      child: Text(
        'Skip',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
