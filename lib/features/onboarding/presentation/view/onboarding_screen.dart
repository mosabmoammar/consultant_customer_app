import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
   OnboardingScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Upper section
          _getPageViewSection(),         
          // Lower Section

        ],
      ),
    );
  }

  Widget _getPageViewSection() {
    return PageView.builder(itemBuilder: (context, index) {
      
    },itemCount: 0,controller: _pageController,);
  }
}