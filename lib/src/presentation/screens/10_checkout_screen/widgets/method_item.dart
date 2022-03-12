import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MethodItem extends StatelessWidget {
  const MethodItem({
    Key? key,
    required this.image,
    required this.selected,
  }) : super(key: key);
  final String image;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70.w,
            height: 55.h,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Image.asset(
              image,
            ),
          ),
          if (selected)
            Positioned(
              top: 3,
              right: 5,
              child: Container(
                width: 18.w,
                height: 18.h,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 12,
                  color: Colors.white,
                ),
              ),
            )
        ],
      ),
    );
  }
}
