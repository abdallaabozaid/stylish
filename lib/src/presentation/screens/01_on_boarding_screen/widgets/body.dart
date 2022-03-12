import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/repo/text_data.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 56.h,
        ),
        _image(),
        SizedBox(
          height: 38.h,
        ),
        _headerText(context),
        SizedBox(
          height: 16.h,
        ),
        _contentText(context),
        SizedBox(
          height: 35.h,
        ),
      ],
    );
  }

  Widget _image() {
    return Image.asset(
      'assets/images/on_boarding/${index + 1}.png',
      width: 325.w,
      height: 325.h,
    );
  }

  Widget _headerText(BuildContext context) {
    return Text(
      headerText[index],
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Widget _contentText(BuildContext context) {
    return Text(
      contentText[index],
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
