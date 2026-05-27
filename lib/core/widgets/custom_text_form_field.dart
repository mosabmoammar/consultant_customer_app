import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/app_spacing.dart';
import '../utils/extensions.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.validator,
     this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.textTheme.titleMedium),
        const SizedBox(height: AppSpacing.s4),
        TextFormField(
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
            suffixIcon: suffixIcon
          ),
          obscureText: obscureText,
          validator: validator,
        ),
      ],
    );
  }
}
