import 'package:flutter/material.dart';

import 'widgets/on_boarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (context, index) =>
            OnBoardingPage(index: index, pageController: _pageController),
      ),
    );
  }
}
