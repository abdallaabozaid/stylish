import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/config/const.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _socialButton(
            assetImage: fbIcon,
            onPressed: () {},
          ),
          _socialButton(
            assetImage: googleIcon,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _socialButton(
      {required String assetImage, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(71, 71),
        primary: Colors.white,
        elevation: 10,
      ),
      child: Image.asset(
        assetImage,
        width: 31.w,
        height: 31.h,
      ),
    );
  }
}
