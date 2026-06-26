import 'package:flutter/material.dart';

import 'package:consultant_customer_app/config/theme/app_colors.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';

import '../../config/theme/app_spacing.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? prefix;
  final String? prefixText;
  final TextStyle? prefixTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  const CustomTextField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.prefix,
    this.prefixText,
    this.prefixTextStyle,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: context.textTheme.labelMedium?.copyWith(
              fontSize: 12.0,
              height: 1.26,
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.s4),
        SizedBox(
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: context.textTheme.labelMedium,
            decoration: InputDecoration(
              fillColor: AppColors.lightGray2,
              filled: true,
              hintText: hintText,
              constraints: const BoxConstraints(maxHeight: AppSpacing.s44),
              hintStyle: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
              prefix: prefix,
              prefixText: prefixText,
              prefixStyle: prefixTextStyle,
              prefixIcon: prefixIcon,
              prefixIconConstraints: prefixIconConstraints,
              contentPadding: contentPadding,
            ),
          ),
        ),
      ],
    );
  }
}
