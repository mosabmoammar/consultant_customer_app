import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';
import '../utils/extensions.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  final String firstNameTab;
  final String secondNameTab;
  const CustomTabBar({
    super.key,
    required this.controller,
    required this.firstNameTab,
    required this.secondNameTab,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      color: context.colorScheme.surfaceContainerHighest,
      child: TabBar(
        controller: controller,
        dividerHeight: 0.0,
        labelColor: Colors.white,
        indicator: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(2.0),
        ),
        padding: const EdgeInsets.all(4.0),
        unselectedLabelColor: AppColors.onTextFieldColor,
        labelStyle: context.textTheme.labelMedium?.copyWith(fontSize: 16.0),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs:  [
          Tab(text: firstNameTab),
          Tab(text: secondNameTab),
        ],
      ),
    );
  }
}
