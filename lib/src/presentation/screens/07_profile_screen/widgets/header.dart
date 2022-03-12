import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 260.h,
              width: MediaQuery.of(context).size.width,
            ),
            _background(),
            _profileAppBar(context),
            _profilImage(),
          ],
        ),
        _profileNameInfo(context,
            email: 'abdallaabozaid211@gmail.com', name: 'Abdulla Abozaid')
      ],
    );
  }

  Widget _profileAppBar(BuildContext context) {
    return Positioned(
      top: 60.h,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: 0,
              child: _threeDots(),
            ),
            Text(
              'Profile',
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 22),
            ),
            PopupMenuButton<Text>(
              // padding: const EdgeInsets.all(0),
              child: const Icon(Icons.more_vert),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r)),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: const Center(
                      child: Text(
                        'Edit',
                      ),
                    ),
                    height: 20.h,
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _threeDots() {
    return const Icon(Icons.more_vert_rounded);
  }

  Widget _background() {
    return Image.asset(
      'assets/images/profile/header_color.png',
      width: 375.w,
    );
  }

  Widget _profilImage() {
    return Positioned(
      bottom: 0,
      child: CircleAvatar(
        backgroundImage:
            const AssetImage('assets/images/profile/profile_pic.jpg'),
        radius: 70.r,
      ),
    );
  }

  Widget _profileNameInfo(
    BuildContext context, {
    required String name,
    required String email,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            email.toString(),
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 10),
          )
        ],
      ),
    );
  }
}
