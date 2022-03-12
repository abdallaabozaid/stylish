import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/src/presentation/screens/07_profile_screen/widgets/header.dart';
import 'package:stylish/src/presentation/screens/07_profile_screen/widgets/info_cards.dart';
import 'package:stylish/src/presentation/screens/07_profile_screen/widgets/personal_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            const InfoCards(),
            const PersonalInfo(),
            SizedBox(
              height: 100.h,
            )
          ],
        ),
      ),
    );
  }
}
