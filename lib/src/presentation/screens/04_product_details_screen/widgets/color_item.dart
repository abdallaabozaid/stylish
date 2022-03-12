import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    Key? key,
    required this.color,
    required this.selected,
  }) : super(key: key);
  final Color color;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 25.w,
      height: 25.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // color: color,
        border: Border.all(
          color: selected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        width: 18.w,
        height: 18.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
