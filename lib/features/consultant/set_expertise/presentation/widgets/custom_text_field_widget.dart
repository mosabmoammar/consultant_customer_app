import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/app_spacing.dart';
import '../../../../../core/utils/extensions.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  const CustomTextFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.textTheme.displayMedium),

        const SizedBox(height: AppSpacing.s4),

        Container(
          height: AppSpacing.s44,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.lightGray2,
            borderRadius: BorderRadius.circular(AppSpacing.s4),
          ),
          child: TextField(
            
            decoration: InputDecoration(

              hintText: hintText,
              hintStyle: context.textTheme.labelMedium?.copyWith(
                color: AppColors.darkGray2,
              ),
            ),
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: controller,
          ),
        ),
      ],
    );
  }
}
