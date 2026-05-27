import 'package:flutter/material.dart';

import 'package:consultant_customer_app/config/theme/app_colors.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';

import '../../config/theme/app_spacing.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.textTheme.titleMedium),
        const SizedBox(height: AppSpacing.s4),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: context.textTheme.labelMedium,
          decoration: InputDecoration(
            fillColor: AppColors.lightGray2,
            filled: true,
            hintText: hintText,
            constraints: const BoxConstraints(maxHeight: AppSpacing.s44),
            hintStyle: context.textTheme.labelMedium?.copyWith(
              color: AppColors.gray,
            ),
          ),
        ),
      ],
    );
  }
}
